#include <string.h>
#include <memory>
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <linux/input.h>

std::string GetKey(char ch)
{
    switch (ch) {
    case KEY_ESC:
        return "KEY_ESC";
    case KEY_1:
        return "KEY_1";
    case KEY_2:
        return "KEY_2";
    case KEY_3:
        return "KEY_3";
    case KEY_4:
        return "KEY_4";
    case KEY_5:
        return "KEY_5";
    case KEY_6:
        return "KEY_6";
    case KEY_7:
        return "KEY_7";
    case KEY_8:
        return "KEY_8";
    case KEY_9:
        return "KEY_9";
    case KEY_0:
        return "KEY_0";
    case KEY_MINUS:
        return "KEY_MINUS";
    case KEY_EQUAL:
        return "KEY_EQUAL";
    case KEY_BACKSPACE:
        return "KEY_BACKSPACE";
    case KEY_TAB:
        return "KEY_TAB";
    case KEY_Q:
        return "KEY_Q";
    case KEY_W:
        return "KEY_W";
    case KEY_E:
        return "KEY_E";
    case KEY_R:
        return "KEY_R";
    case KEY_T:
        return "KEY_T";
    case KEY_Y:
        return "KEY_Y";
    case KEY_U:
        return "KEY_U";
    case KEY_I:
        return "KEY_I";
    case KEY_O:
        return "KEY_O";
    case KEY_P:
        return "KEY_P";
    case KEY_LEFTBRACE:
        return "KEY_LEFTBRACE";
    case KEY_RIGHTBRACE:
        return "KEY_RIGHTBRACE";
    case KEY_ENTER:
        return "KEY_ENTER";
    case KEY_LEFTCTRL:
        return "KEY_LEFTCTRL";
    case KEY_A:
        return "KEY_A";
    case KEY_S:
        return "KEY_S";
    case KEY_D:
        return "KEY_D";
    case KEY_F:
        return "KEY_F";
    case KEY_G:
        return "KEY_G";
    case KEY_H:
        return "KEY_H";
    case KEY_J:
        return "KEY_J";
    case KEY_K:
        return "KEY_K";
    case KEY_L:
        return "KEY_L";
    case KEY_SEMICOLON:
        return "KEY_SEMICOLON";
    case KEY_APOSTROPHE:
        return "KEY_APOSTROPHE";
    case KEY_GRAVE:
        return "KEY_GRAVE";
    case KEY_LEFTSHIFT:
        return "KEY_LEFTSHIFT";
    case KEY_BACKSLASH:
        return "KEY_BACKSLASH";
    case KEY_Z:
        return "KEY_Z";
    case KEY_X:
        return "KEY_X";
    case KEY_C:
        return "KEY_C";
    case KEY_V:
        return "KEY_V";
    case KEY_B:
        return "KEY_B";
    case KEY_N:
        return "KEY_N";
    case KEY_M:
        return "KEY_M";
    case KEY_COMMA:
        return "KEY_COMMA";
    case KEY_DOT:
        return "KEY_DOT";
    case KEY_SLASH:
        return "KEY_SLASH";
    case KEY_RIGHTSHIFT:
        return "KEY_RIGHTSHIFT";
    case KEY_KPASTERISK:
        return "KEY_KPASTERISK";
    case KEY_LEFTALT:
        return "KEY_LEFTALT";
    case KEY_SPACE:
        return "KEY_SPACE";
    case KEY_CAPSLOCK:
        return "KEY_CAPSLOCK";
    case KEY_F1:
        return "KEY_F1";
    case KEY_F2:
        return "KEY_F2";
    case KEY_F3:
        return "KEY_F3";
    case KEY_F4:
        return "KEY_F4";
    case KEY_F5:
        return "KEY_F5";
    case KEY_F6:
        return "KEY_F6";
    case KEY_F7:
        return "KEY_F7";
    case KEY_F8:
        return "KEY_F8";
    case KEY_F9:
        return "KEY_F9";
    case KEY_F10:
        return "KEY_F10";
    case KEY_NUMLOCK:
        return "KEY_NUMLOCK";
    case KEY_SCROLLLOCK:
        return "KEY_SCROLLLOCK";
    case KEY_KP7:
        return "KEY_KP7";
    case KEY_KP8:
        return "KEY_KP8";
    case KEY_KP9:
        return "KEY_KP9";
    case KEY_KPMINUS:
        return "KEY_KPMINUS";
    case KEY_KP4:
        return "KEY_KP4";
    case KEY_KP5:
        return "KEY_KP5";
    case KEY_KP6:
        return "KEY_KP6";
    case KEY_KPPLUS:
        return "KEY_KPPLUS";
    case KEY_KP1:
        return "KEY_KP1";
    case KEY_KP2:
        return "KEY_KP2";
    case KEY_KP3:
        return "KEY_KP3";
    case KEY_KP0:
        return "KEY_KP0";
    case KEY_KPDOT:
        return "KEY_KPDOT";
    case KEY_ZENKAKUHANKAKU:
        return "KEY_ZENKAKUHANKAKU";
    case KEY_102ND:
        return "KEY_102ND";
    case KEY_F11:
        return "KEY_F11";
    case KEY_F12:
        return "KEY_F12";
    case KEY_RO:
        return "KEY_RO";
    case KEY_KATAKANA:
        return "KEY_KATAKANA";
    case KEY_HIRAGANA:
        return "KEY_HIRAGANA";
    case KEY_HENKAN:
        return "KEY_HENKAN";
    case KEY_KATAKANAHIRAGANA:
        return "KEY_KATAKANAHIRAGANA";
    case KEY_MUHENKAN:
        return "KEY_MUHENKAN";
    case KEY_KPJPCOMMA:
        return "KEY_KPJPCOMMA";
    case KEY_KPENTER:
        return "KEY_KPENTER";
    case KEY_RIGHTCTRL:
        return "KEY_RIGHTCTRL";
    case KEY_KPSLASH:
        return "KEY_KPSLASH";
    case KEY_SYSRQ:
        return "KEY_SYSRQ";
    case KEY_RIGHTALT:
        return "KEY_RIGHTALT";
    case KEY_HOME:
        return "KEY_HOME";
    case KEY_UP:
        return "KEY_UP";
    case KEY_PAGEUP:
        return "KEY_PAGEUP";
    case KEY_LEFT:
        return "KEY_LEFT";
    case KEY_RIGHT:
        return "KEY_RIGHT";
    case KEY_END:
        return "KEY_END";
    case KEY_DOWN:
        return "KEY_DOWN";
    case KEY_PAGEDOWN:
        return "KEY_PAGEDOWN";
    case KEY_INSERT:
        return "KEY_INSERT";
    case KEY_DELETE:
        return "KEY_DELETE";
    case KEY_MACRO:
        return "KEY_MACRO";
    case KEY_MUTE:
        return "KEY_MUTE";
    case KEY_VOLUMEDOWN:
        return "KEY_VOLUMEDOWN";
    case KEY_VOLUMEUP:
        return "KEY_VOLUMEUP";
    case KEY_POWER:
        return "KEY_POWER";
    case KEY_KPEQUAL:
        return "KEY_KPEQUAL";
    case KEY_KPPLUSMINUS:
        return "KEY_KPPLUSMINUS";
    case KEY_PAUSE:
        return "KEY_PAUSE";
    case KEY_KPCOMMA:
        return "KEY_KPCOMMA";
    case KEY_HANGUEL:
        return "KEY_HANGUEL";
    case KEY_HANJA:
        return "KEY_HANJA";
    case KEY_YEN:
        return "KEY_YEN";
    case KEY_LEFTMETA:
        return "KEY_LEFTMETA";
    case KEY_RIGHTMETA:
        return "KEY_RIGHTMETA";
    case KEY_COMPOSE:
        return "KEY_COMPOSE";
    case KEY_STOP:
        return "KEY_STOP";
    case KEY_CALC:
        return "KEY_CALC";
    case KEY_SETUP:
        return "KEY_SETUP";
    case KEY_SLEEP:
        return "KEY_SLEEP";
    case KEY_WAKEUP:
        return "KEY_WAKEUP";
    case KEY_PROG1:
        return "KEY_PROG1";
    case KEY_SCREENLOCK:
        return "KEY_SCREENLOCK";
    case KEY_MAIL:
        return "KEY_MAIL";
    case KEY_BOOKMARKS:
        return "KEY_BOOKMARKS";
    case KEY_COMPUTER:
        return "KEY_COMPUTER";
    case KEY_BACK:
        return "KEY_BACK";
    case KEY_FORWARD:
        return "KEY_FORWARD";
    case KEY_EJECTCLOSECD:
        return "KEY_EJECTCLOSECD";
    case KEY_NEXTSONG:
        return "KEY_NEXTSONG";
    case KEY_PLAYPAUSE:
        return "KEY_PLAYPAUSE";
    case KEY_PREVIOUSSONG:
        return "KEY_PREVIOUSSONG";
    case KEY_STOPCD:
        return "KEY_STOPCD";
    case KEY_HOMEPAGE:
        return "KEY_HOMEPAGE";
    case KEY_REFRESH:
        return "KEY_REFRESH";
    case KEY_F13:
        return "KEY_F13";
    case KEY_F14:
        return "KEY_F14";
    case KEY_F15:
        return "KEY_F15";
    case KEY_F21:
        return "KEY_F21";
    case KEY_SUSPEND:
        return "KEY_SUSPEND";
    case KEY_CAMERA:
        return "KEY_CAMERA";
    case KEY_EMAIL:
        return "KEY_EMAIL";
    case KEY_SEARCH:
        return "KEY_SEARCH";
    case KEY_BRIGHTNESSDOWN:
        return "KEY_BRIGHTNESSDOWN";
    case KEY_BRIGHTNESSUP:
        return "KEY_BRIGHTNESSUP";
    case KEY_MEDIA:
        return "KEY_MEDIA";
    case KEY_SWITCHVIDEOMODE:
        return "KEY_SWITCHVIDEOMODE";
    case KEY_BATTERY:
        return "KEY_BATTERY";
    case KEY_UNKNOWN:
        return "KEY_UNKNOWN";
    }
    return "UNKNOWN";
}

std::vector<std::string> GetKeyboard()
{
    std::ifstream file("/proc/bus/input/devices");
    if (!file.is_open()) {
        std::cout << "unable to open devices" << std::endl;
        return {};
    }

    std::vector<std::string> keyboards;
    bool inKeyboardSection = false;
    for (std::string line; getline(file, line);) {
        std::transform(line.begin(), line.end(), line.begin(), ::tolower);
        if (line.find("keyboard") != line.npos)
            inKeyboardSection = true;
        if (inKeyboardSection && line.empty())
            inKeyboardSection = false;
        if (inKeyboardSection && line.find("h: handlers=") != line.npos && line.find("kbd") != line.npos) {
            auto start = line.find("event");
            auto end = line.find(" ", start);
            if (start != line.npos && end != line.npos) {
                keyboards.push_back("/dev/input/" + line.substr(start, end - start));
            }
        }
    }
    return keyboards;
}

int main(int argc, char* argv[])
{
    auto kbds = GetKeyboard();
    if (kbds.empty()) {
        std::cout << "no keyboard found" << std::endl;
        return 1;
    }

    std::string keys;
    for (auto kbd : kbds) {
        auto deleter = [](FILE* fd) { fclose(fd); };
        std::unique_ptr<FILE, decltype(deleter)> fpKbd(fopen(kbd.c_str(), "r"), deleter);

        if (!fpKbd) {
            std::cout << "unable to open keyboard" << std::endl;
            return 1;
        }

        char keyMap[KEY_MAX / 8 + 1];

        memset(keyMap, 0, sizeof(keyMap));
        ioctl(fileno(fpKbd.get()), EVIOCGKEY(sizeof(keyMap)), keyMap);
        for (int i = 0; i < KEY_MAX / 8 + 1; ++i) {
            auto ch = keyMap[i];
            for (int j = 0; j < 8; ++j) {
                if ((ch >> j) & 1) {
                    if (!keys.empty())
                        keys += ",";
                    keys += GetKey(i * 8 + j);
                }
            }
        }
    }

    if (!keys.empty())
        std::cout << keys << std::endl;
}