#include <iostream>

int main(int argc, char *argv[]) {
    std::cout << argv[0] << std::endl;
    if (argv[0]=="fail") return 1;
    return 0;
}
