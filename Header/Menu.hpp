#ifndef _MENU_H_
#define _MENU_H_
#include "../Header/GUI_Class.hpp"
#include "../Header/Barcode.hpp"
#include "../Header/TestAll.hpp"
#include "../Header/IOtest.hpp"

enum ButtonState
{
    Barcode = 0,
    MainBoard = 1,
    IO_Board = 2,
    PreState =3
};

class Menu 
{
public:
    Menu();
public:
    int x, y;
    ButtonState Run();
    int ScreenButton(ButtonState state);

   private:
    WINDOW* win;
};



#endif