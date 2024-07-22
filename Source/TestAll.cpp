#include "../Header/TestAll.hpp"

string g_startTime;
string g_endTime;
string g_result;
TestAll_c::TestAll_c()
{
    win_frame = newwin(LINES,COLS/2 - 1 ,0,0); //(lines, colums, start_y, start_x)
    win = newwin(LINES -5,COLS/2 -5 ,0 +2,0+2); //(lines, colums, start_y, start_x)
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

bool containsFailed(const std::string& str) {
    // 搜尋 "Failed" 在字串中的位置
    size_t found = str.find("Fail");
    // 如果找到，返回 true；如果找不到，返回 false
    size_t found2 = str.find("FAIL");

    return ((found != std::string::npos)||(found2 != std::string::npos));
}

int TestAll_c::Run()
{
    int nodeCh;
    string item[] = {"Buzzer","Network","USB","BurnIn","PCIe","DIO","EMMc","TotalMemory","SATA","TPM","Result"};
    tarPath = "/MainBoard/TestScript.sh ";
    static bool b_err = false;
    GUI_Get_Current_Path(tarPath, input, shell_cmd);
    g_startTime = GetTime();
    //Count test item
    for(int cnt = 0; cnt < 11; cnt++)
    {

        //Update left Page
        DM_Statement(cnt);
        
        wprintw(win1, "%s Start Test\n", item[cnt].c_str());
        wrefresh(win1);

        ShellCmd( shell_cmd + item[cnt], shell_result);
       if(cnt == 0)
        {
            node_win = create_subwindow();
            display_subwindow(node_win, "Please check the buzzer sound.", true);
            while((nodeCh != 10) && (nodeCh != 13) )
            {
                nodeCh = getch();
                if(nodeCh == KEY_RIGHT)
                {
                    b_node = true;
                    display_subwindow(node_win, "Please check the buzzer sound.", false);
                    shell_result = insertTextBeforeEndBuzzerTest(shell_result,"[FAIL] Buzzer is not sound.");
                }
                else if(nodeCh == KEY_LEFT)
                {
                    b_node = false;
                    display_subwindow(node_win, "Please check the buzzer sound.", true);
                }
            }
            delete_subwindow(node_win);
            nodeCh = 0;
        }else if(cnt == 1)
        {
            node_win = create_subwindow();
            display_subwindow(node_win, "Please check the network port indicator lights.", true);
            while((nodeCh != 10) && (nodeCh != 13) )
            {
                nodeCh = getch();
                if(nodeCh == KEY_RIGHT)
                {
                    b_node = true;
                    display_subwindow(node_win, "Please check the network port indicator lights.", false);
                    shell_result = insertTextBeforeEndBuzzerTest(shell_result,"[FAIL] Network port indicator lights is not work.");

                }
                else if(nodeCh == KEY_LEFT)
                {
                    b_node = false;
                    display_subwindow(node_win, "Please check the network port indicator lights.", true);
                }
            }
            delete_subwindow(node_win);
            nodeCh = 0;
        }else if(cnt ==5)
        {
            node_win = create_subwindow();
            display_subwindow(node_win, "Please check the IO board LED indicators.", true);
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
            nodeCh = 0;
        }
        all_res = all_res + shell_result;
        wprintw(win1, "%s", shell_result.c_str());
        wprintw(win1, "%s END\n\n", item[cnt].c_str());
        wrefresh(win1);
      
        b_err = containsFailed(shell_result);

        if( b_err || b_node)
        {
            g_endTime = GetTime();
            g_result = "FAIL";
            s_error=s_error+shell_result;
            wclear(win1);
            wprintw(win1, "-----------Result----------\n\n");
            wprintw(win1, "%s", s_error.c_str());
            wattron(win1,A_REVERSE);
            wprintw(win1, "%s", "<- Pre Step");
            wattroff(win1,A_REVERSE);
            wrefresh(win1);

            break;
        }
        else if((cnt==10) && (b_err != true))
        {
            g_endTime = GetTime();
            g_result = "PASS";
            clear();
            refresh();
            ShowToPASS();
            refresh();
            break; 
        }
    }
    
    Logger c_record;
    c_record.Run(all_res);

      ch = wgetch(win_frame);
      clear();
        refresh();

}

void TestAll_c::DM_Statement(int currTest)
{
    mvwaddstr(win, 0, 2, "Buzzer         ");
    mvwaddstr(win, 2, 2, "Network        ");
    mvwaddstr(win, 4, 2, "USB        ");
    mvwaddstr(win, 6, 2, "BurnIn        ");
    mvwaddstr(win, 8, 2, "PCIe        ");
    mvwaddstr(win, 10, 2, "DIO        ");
    mvwaddstr(win, 12, 2, "EMMc        ");
    mvwaddstr(win, 14, 2, "Total Memory        ");
    mvwaddstr(win, 16, 2, "SATA        ");
    mvwaddstr(win, 18, 2, "TPM        ");
    mvwaddstr(win, 20, 2, "DONE        ");
  switch(currTest) 
  {
      case 0: mvwaddstr(win, 0, 2, "Buzzer  <--"); break;
      case 1: mvwaddstr(win, 2, 2, "Network  <--"); break;
      case 2: mvwaddstr(win, 4, 2, "USB  <--"); break;
      case 3: mvwaddstr(win, 6, 2, "BurnIn  <--"); break;
      case 4: mvwaddstr(win, 8, 2, "PCIe  <--"); break;
      case 5: mvwaddstr(win, 10, 2, "DIO  <--"); break;
      case 6: mvwaddstr(win, 12, 2, "EMMc  <--"); break;
      case 7: mvwaddstr(win, 14, 2, "Total Memory  <--"); break;
      case 8: mvwaddstr(win, 16, 2, "SATA  <--"); break;
      case 9: mvwaddstr(win, 18, 2, "TPM  <--"); break;

      default: mvwaddstr(win, 18, 2, "DONE  <--"); break;

  }  
  wrefresh(win);
}


// 創建子視窗
WINDOW* TestAll_c::create_subwindow() {
    WINDOW* win = newwin(5, 55, LINES/2, COLS/2);
    box(win, 0, 0); // 添加邊框
    return win;
}

// 顯示子視窗內容
void TestAll_c::display_subwindow(WINDOW* win, string message, bool b_node) {
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
void TestAll_c::delete_subwindow(WINDOW* win) {
    if (win) {
        werase(win); // 清除子視窗內容
        wrefresh(win); // 刷新子視窗以應用清除操作
        delwin(win); // 刪除子視窗
        refresh(); // 刷新主視窗
    }
}

std::string TestAll_c::insertTextBeforeEndBuzzerTest(const std::string& original, const std::string& textToInsert) {
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