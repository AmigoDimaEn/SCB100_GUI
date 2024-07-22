#ifndef _IOtest_H_
#define _IOtest_H_
#include "../Header/GUI_Class.hpp"
#include "../Header/Record.hpp"
#include "../Header/TestAll.hpp"


class IOTest_c : public Page_Interface
{
public:
    IOTest_c();
    bool winSetup = false;
public:   
    int DM_Statement(int currTest);
    WINDOW* create_subwindow();
    void display_subwindow(WINDOW* win, string message, bool b_node);
    void delete_subwindow(WINDOW* win);
        std::string insertTextBeforeEndBuzzerTest(const std::string& original, const std::string& textToInsert);

    int Run();
private:
    int ch;
        bool b_node = false;

    std::string tarPath, shell_cmd, shell_result, input, all_res;
    WINDOW *win, *win_frame, *win1, *win1_frame, *node_win; 
};
extern string g_startTime;
extern string g_endTime;
extern string g_result;

#endif