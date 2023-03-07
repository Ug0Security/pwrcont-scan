user="admin"
pass="1234"
chall=$(curl -sk $1 | grep 'name="Challenge"' | grep -o -P '(?<=value=").*(?=">)')

echo "Challenge : $chall"
all=$chall 
all+=$user
all+=$pass
all+=$chall

echo "Concatenation : $all"

password=$(echo -n $all | md5sum | cut -d " " -f1)

echo "Password input : $password"

curl -sk -X POST $1/login.tgi -d "Username=admin&Password=$password"
