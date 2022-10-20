# Bash script to assemble, link, execute and show results
# of assembly scripts

read -p 'Enter directory name:' name

cd ./$name

# Remove all file except the .s script

find . ! -name $name.s -type f -exec rm -f {} +

# Assemble

as $name.s -o $name.o

# Link

ld $name.o -o $name

# Execute

./$name

# Echo status code 

echo $?

cd ..
