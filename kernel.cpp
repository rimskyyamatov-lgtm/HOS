extern "C" void kernel_main() {
    unsigned short* terminal_buffer = (unsigned short*) 0xB8000;
    const char* str = "Hello,World!";
    for (int i = 0; str[i] != '\0'; i++) {
        terminal_buffer[i] = (unsigned short) str[i] | (unsigned short) 0x07 << 8;
    }
}
