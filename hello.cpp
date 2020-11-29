#include <iostream>
#include <string>

int main(int argc, char *argv[]) {
    try {
        std::string arg = argv[1];
        if (arg == "fail")
            return 1;
    }
    catch (...) {
        return 2;
    }
}
