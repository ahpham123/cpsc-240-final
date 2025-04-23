#Anderson Pham - Section 3
#884815002

rm *.lis
rm *.o
rm *.out

echo "Compile the source file welcome.cpp"
g++  -m64 -Wall -no-pie -o welcome.o -std=c++20 -c welcome.cpp -g

echo "Assemble the source file manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm -gdwarf

echo "Assemble the source file getqword.asm"
nasm -f elf64 -l getqword.lis -o getqword.o getqword.asm -gdwarf

echo "Link the object modules to create an executable file"
g++ -m64 -no-pie -o output.out welcome.o manager.o getqword.o -z noexecstack -lm -g

echo "Execute the program"
chmod +x output.out
./output.out

rm *.lis
rm *.o

echo "This bash script will now terminate."