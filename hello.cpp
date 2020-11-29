#include <iostream>

int main(int argc, char *argv[]) {
    std::cout << argv[1] << std::endl;
    if (argv[1]=="fail") return 1;
    return 0;
}
