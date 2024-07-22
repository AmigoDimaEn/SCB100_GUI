#ifndef _BARCODE_H_
#define _BARCODE_H_
#include "../Header/GUI_Class.hpp"

class Barcode_c : public Page_Interface
{
public:
    Barcode_c();
public:   

    bool winSetup = false;

    int Run();

private:
    int ch, x, y, org_x, org_y;
    std::string barcode;
    std::string tf;
    std::string tarPath, shell_cmd, shell_result;
    WINDOW *win,*win1, *win1_frame; 
   
};


#endif