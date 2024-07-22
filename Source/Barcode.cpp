#include "../Header/Barcode.hpp"

Barcode_c::Barcode_c()
{
    win = newwin(LINES,COLS/2 - 1 ,0,0); //(lines, colums, start_y, start_x)
    win1_frame = newwin(LINES, COLS/2, 0, COLS/2);
    win1 = newwin(LINES-2, COLS/2-2, 0 +1, COLS/2 +1);
    intrflush(win, FALSE);
    scrollok(win1,TRUE);
    keypad(win, TRUE);
    box(win,0,0);
    box(win1_frame,0,0);
    mvwaddstr(win, LINES/10, COLS/10,"Please scan/key barcode :");
    mvwaddstr(win, LINES/10 + 2, COLS/10 + 1, "[                    ]" );
    mvwaddstr(win, LINES/10 + 4, COLS/10 + 1, "<- Pre Step"  );
    refresh();   
    wrefresh(win);
    wrefresh(win1_frame);
    y = org_y = LINES/10 + 2;
    x = org_x = COLS/10 + 2;
    move(y , x);
    refresh(); 
}


int Barcode_c::Run()
{
   while(1)
   {
        ch = wgetch(win);
        switch(ch) {
            case '\r': // 判斷是否 ENTER 鍵被按下
            if(winSetup == false)
            {
                wprintw(win1, "You key the mac address is :%s\n", barcode.c_str());
                wrefresh(win1);
                tarPath = "/MAC/macid.sh ";
                GUI_Get_Current_Path(tarPath, barcode, shell_cmd);
              
                ShellCmd(shell_cmd, shell_result);
                wprintw(win1, "%s\n", shell_result.c_str());
                wrefresh(win1);
                mvwaddstr(win, org_y, org_x, "                   ");
                barcode = "";
                x = org_x;
                refresh(); 
            }
            else
            {
                clear();
                refresh();
                return 0;
            }
                
                break;
            case KEY_UP:
            if(winSetup == true)
            {
                winSetup = false;
                mvwaddstr(win, LINES/10 + 4, COLS/10 + 1, "<- Pre Step" );

            }
                break;
            case KEY_DOWN:
            if(winSetup == false)
            {
                wattron(win,A_REVERSE);
                mvwaddstr(win, LINES/10 + 4, COLS/10 + 1, "<- Pre Step" );
                wattroff(win,A_REVERSE);
                winSetup = true;
            }
                
                break;
            case KEY_RIGHT:
                if((x - org_x) < barcode.length())
                    ++x;
                break;
            case KEY_LEFT: 
                if(x > org_x)
                    --x;
                break;
            case 263: // Backspace
                if((barcode.length() != MIN_MAC_ID_LEN) || (barcode.length() >= MAX_MAC_ID_LEN))
                {
                    mvwaddch(win, y, --x, ' ');
                    barcode.erase((x - org_x), 1);
                }
                break;
            case 27: // ESC
                return 27;
                break;
            default:
                if(barcode.length() < MAX_MAC_ID_LEN)
                {
                    tf = (char)ch;
                    barcode.insert((x - org_x), tf);
                    ++x;
                }
                break;
        }
        mvwaddstr(win, org_y, org_x, "                   ");
        mvwaddstr(win, org_y, org_x, barcode.c_str());
        wmove(win, y, x);

        wrefresh(win); // 刷新窗口以顯示更新的內容
        refresh();
    }


}