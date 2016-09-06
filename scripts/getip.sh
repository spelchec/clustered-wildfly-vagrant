STR=$(ip addr | grep 172*)
# echo str=$STR
echo $STR | grep -oP "(\d+\.\d+\.\d+.\d+)" | tail -n 2 | head -n 1
