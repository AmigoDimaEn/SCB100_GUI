#ifndef _GUI_CLASS_H_
#define _GUI_CLASS_H_

#include "./GUI_Struct.hpp"
#include "./GUI_Error.hpp"
using namespace std;



class Page_Interface
{
public:
    virtual int DM_Window(){ return ERR_FUNCTION_NO_MATERIALIZATION; };
    virtual int DM_Button(){ return ERR_FUNCTION_NO_MATERIALIZATION; };
    virtual int DM_Title(){ return ERR_FUNCTION_NO_MATERIALIZATION; };
    virtual int DM_Statement(){ return ERR_FUNCTION_NO_MATERIALIZATION; };
    virtual int DM_Key(){ return ERR_FUNCTION_NO_MATERIALIZATION; };
    virtual int DM_Call_Script(){ return ERR_FUNCTION_NO_MATERIALIZATION; };
    

    bool ShellCmd(const string &cmd, string &result) 
    {
        char buffer[512];
        result = "";

        // Open pipe to file
        FILE* pipe = popen(cmd.c_str(), "r");
        if (!pipe) {
            return false;
        }

        // read till end of process:
        while (!feof(pipe)) {
            // use buffer to read and add to result
            if (fgets(buffer, sizeof(buffer), pipe) != NULL)
                result += buffer;
        }
        pclose(pipe);
        return true;
    }

    void GUI_Get_Current_Path( string &target, string &input, string &res )
    {
        char buf[1024] = {};
        std::string currentPath_s;
        readlink("/proc/self/exe", buf, sizeof(buf));
        currentPath_s = std::string(buf);
        int li=currentPath_s.find_last_of("/");
        currentPath_s=currentPath_s.substr(0,li);
        res = "bash " + currentPath_s + target + input;
    }

   void ShowToPASS()
    {
        mvaddstr( LINES/4, COLS/4,"       d8888 888      888        8888888b.     d8888 .d8888b.  .d8888b. ");
        mvaddstr( LINES/4 + 1, COLS/4,"      d88888 888      888        888   Y88b   d88888d88P  Y88bd88P  Y88b");
        mvaddstr( LINES/4 + 2, COLS/4,"     d88P888 888      888        888    888  d88P888Y88b.     Y88b.      ");
        mvaddstr( LINES/4 + 3, COLS/4,"    d88P 888 888      888        888   d88P d88P 888 \"Y888b.   \"Y888b.");
        mvaddstr( LINES/4 + 4, COLS/4,"   d88P  888 888      888        8888888P\" d88P  888    \"Y88b.    \"Y88b.");
        mvaddstr( LINES/4 + 5, COLS/4,"  d88P   888 888      888        888      d88P   888      \"888      \"888 ");
        mvaddstr( LINES/4 + 6, COLS/4," d8888888888 888      888        888     d8888888888Y88b  d88PY88b  d88P ");
        mvaddstr( LINES/4 + 7, COLS/4,"d88P     888 88888888 88888888   888    d88P     888 \"Y8888P\"  \"Y8888P\" ");
    }

public:
    Page_Interface()
    {
        
    }

    ~Page_Interface()
    {

    }

};


#endif
