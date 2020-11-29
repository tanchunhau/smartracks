#include <iostream>
#include <string>

int main(int argc, char *argv[]) {
    std::string arg = argv[argc-1];
    if (arg == "fail")
        return 1;
}
