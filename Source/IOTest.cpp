#include "../Header/IOtest.hpp"

IOTest_c::IOTest_c()
{
   win_frame = newwin(LINES,COLS/2 - 1 ,0,0); //(lines, colums, start_y, start_x)
    win = newwin(LINES-5,COLS/2 - 5 ,0+2,0+2); //(lines, colums, start_y, start_x)
    win1_frame = newwin(LINES, COLS/2, 0, COLS/2);
    win1 = newwin(LINES-2, COLS/2-2, 0 +1, COLS/2 +1);
    intrflush(win, FALSE);
    scrollok(win1,TRUE);
    keypad(win, TRUE);
    box(win_frame,0,0);
    box(win1_frame,0,0);
    refresh();   
    wrefresh(win_frame);
    wrefresh(win1_frame);
}

int IOTest_c::DM_Statement(int currTest)
{
    mvwaddstr(win, 0, 2, "GPIO_TEST        ");
    mvwaddstr(win, 4, 2, "DONE        ");
  switch(currTest) 
  {
      case 0: mvwaddstr(win, 0, 2, "GPIO_TEST   <--"); break;
      default: mvwaddstr(win, 4, 2, "DONE  <--"); break;
  }  
  wrefresh(win);
}


int IOTest_c::Run()
{
        int nodeCh;

    static bool b_err = false;
    string item[] = {"TEST_IO","Result"};
    tarPath = "/IO_Board/TestDIO.sh ";
    GUI_Get_Current_Path(tarPath, input, shell_cmd); 
    g_startTime = GetTime();

        wprintw(win1, "GPIO %s Start Test\n", item[0].c_str());
        wrefresh(win1);
        DM_Statement(0);
        ShellCmd( shell_cmd + item[0].c_str(), shell_result);
        node_win = create_subwindow();
        display_subwindow(node_win,"Please check the IO board LED indicators.", true);
         while((nodeCh != 10) && (nodeCh != 13) )
            {
                nodeCh = getch();
                if(nodeCh == KEY_RIGHT)
                {
                    b_node = true;
                    display_subwindow(node_win, "Please check the IO board LED indicators.", false);
                    shell_result = insertTextBeforeEndBuzzerTest(shell_result,"[FAIL] IO board LED indicators is not work.");
                }
                else if(nodeCh == KEY_LEFT)
                {
                    b_node = false;
                    display_subwindow(node_win, "Please check the IO board LED indicators.", true);
                }
            }
        delete_subwindow(node_win);
        all_res=all_res+shell_result;
        b_err = containsFailed(shell_result);
        wprintw(win1, "%s\n", shell_result.c_str());
        wprintw(win1, "GPIO %s Test END\n\n", item[0].c_str());
        wrefresh(win1);

        if( b_err)
        {
            g_endTime = GetTime();
            g_result = "FAIL";
            wclear(win1);
            wprintw(win1, "-----------Result----------\n");
            wprintw(win1, "%s", all_res.c_str());
            wattron(win1,A_REVERSE);
            wprintw(win1, "%s", "<- Pre Step");
            wattroff(win1,A_REVERSE);
            wrefresh(win1);
        }
        else if(b_err != true)
        {
            g_endTime = GetTime();
            g_result = "PASS";
            clear();
            refresh();
            ShowToPASS();
            refresh();
        }

     Logger c_record;
    c_record.Run(all_res);
    ch = wgetch(win);
     clear();
        refresh();

}


// 創建子視窗
WINDOW* IOTest_c::create_subwindow() {
    WINDOW* win = newwin(3, 55, LINES/2, COLS/2);
    box(win, 0, 0); // 添加邊框
    return win;
}

// 顯示子視窗內容
void IOTest_c::display_subwindow(WINDOW* win, string message, bool b_node) {
    if (win) {
        if(b_node == true)
        {
            mvwprintw(win, 1, 1, message.c_str());
            wattron(win,A_REVERSE);
            mvwprintw(win, 2, 1, "PASS");
            wattroff(win,A_REVERSE);
            mvwprintw(win, 2, 10, "FAIL");
            wrefresh(win); // 刷新子視窗以顯示內容
        }else if(b_node == false)
        {
            mvwprintw(win, 1, 1, message.c_str());
            wattron(win,A_REVERSE);
            mvwprintw(win, 2, 10, "FAIL");
            wattroff(win,A_REVERSE);
            mvwprintw(win, 2, 1, "PASS");
            wrefresh(win); // 刷新子視窗以顯示內容            
        }
        
    }
}

// 刪除子視窗
void IOTest_c::delete_subwindow(WINDOW* win) {
    if (win) {
        werase(win); // 清除子視窗內容
        wrefresh(win); // 刷新子視窗以應用清除操作
        delwin(win); // 刪除子視窗
        refresh(); // 刷新主視窗
    }
}

std::string IOTest_c::insertTextBeforeEndBuzzerTest(const std::string& original, const std::string& textToInsert) {
    std::string endBuzzerTestMarker = "[END";
    size_t pos = original.find(endBuzzerTestMarker);
    if (pos == std::string::npos) {
        return original; // 如果找不到，返回原始字串
    }

    // 找到 [END Buzzer Test ... 的前一行插入文字
    size_t insertPos = original.rfind('\n', pos);
    if (insertPos == std::string::npos) {
        return original; // 如果找不到，返回原始字串
    }

    // 插入文字
    std::string newString = original;
    newString.insert(insertPos + 1, textToInsert + "\n");
    return newString;
}