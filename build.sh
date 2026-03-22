nasm -f elf32 boot.s -o boot.o
g++ -m32 -c kernel.cpp -o kernel.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
ld -m elf_i386 -T linker.ld boot.o kernel.o -o hos.bin
rm -rf isodir
mkdir -p isodir/boot/grub
cp hos.bin isodir/boot/
cat << EOF > isodir/boot/grub/grub.cfg
menuentry "HOS" {
    multiboot /boot/hos.bin
    boot
}
EOF
grub-mkrescue -o hos.iso isodir