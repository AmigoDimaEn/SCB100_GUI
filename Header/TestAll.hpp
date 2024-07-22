#ifndef _TESTALL_H_
#define _TESTALL_H_
#include "../Header/GUI_Class.hpp"
#include "../Header/Record.hpp"

class TestAll_c : public Page_Interface
{
public:
    TestAll_c();
    bool winSetup = false;
public:   
    int Run();
    void DM_Statement(int currTest);
    WINDOW* create_subwindow();
    void display_subwindow(WINDOW* win, string message, bool b_node);
    void delete_subwindow(WINDOW* win);
    std::string insertTextBeforeEndBuzzerTest(const std::string& original, const std::string& textToInsert);
private:
    int ch;
    bool b_node = false;
    std::string tarPath, shell_cmd, shell_result, input, all_res, s_error;
    WINDOW *win, *win_frame ,*win1, *win1_frame, *node_win; 
};
    bool containsFailed(const std::string& str);


#endif