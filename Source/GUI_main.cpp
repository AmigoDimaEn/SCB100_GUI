#include "../Header/GUI_main.hpp"
#include "../Header/Menu.hpp"
const int NUM_FIELDS = 3;
const int FIELD_WIDTH = 20;
const int NEXT_STEP_ROW = NUM_FIELDS + 3;
const int NEXT_STEP_COL = 10;
std::vector<std::string> field_values(NUM_FIELDS, "");

void show_first_window(WINDOW* win, const std::vector<std::string>& field_labels, std::vector<std::string>& field_values, int active_field) {
    wclear(win);

    // 顯示表格標籤和值
    for (int i = 0; i < NUM_FIELDS; ++i) {
        mvwprintw(win, i + 1, 1, "%s", field_labels[i].c_str());
        if (i == active_field) {
            wattron(win, A_REVERSE);
            mvwprintw(win, i + 1, 15, "%s", field_values[i].c_str());
            wattroff(win, A_REVERSE);
        } else {
            mvwprintw(win, i + 1, 15, "%s", field_values[i].c_str());
        }
    }

    // 顯示 "Next Step" 文字
    if (active_field == NUM_FIELDS) {
        wattron(win, A_REVERSE);
        mvwprintw(win, NEXT_STEP_ROW, NEXT_STEP_COL, "Next Step");
        wattroff(win, A_REVERSE);
    } else {
        mvwprintw(win, NEXT_STEP_ROW, NEXT_STEP_COL, "Next Step");
    }
    wrefresh(win);
}

int main() 
{
    initscr();            // 初始化螢幕
    noecho();             // 關閉鍵盤輸入顯示
    curs_set(TRUE);       // 顯示游標
    keypad(stdscr, TRUE); // 啟用鍵盤輸入

    // 定義表格標籤和初始值
    std::vector<std::string> field_labels = {
        "Tester ID:   ",
        "Station ID:  ",
        "SN Number:   "
    };


    int active_field = 0;
    int ch;
    while (true) 
    {
        show_first_window(stdscr, field_labels, field_values, active_field);
        if (active_field < NUM_FIELDS) {
            move(active_field + 1, 15 + field_values[active_field].length()); // 將游標移到活動欄位的末尾
        } else 
        {
            move(NEXT_STEP_ROW, NEXT_STEP_COL); // 將游標移到 "Next Step"
        }

        ch = getch();
        if ((ch == 13) || (ch == 10)) { // 10 是 Enter 鍵的 ASCII 值
            if (active_field == NUM_FIELDS) {
                // "Next Step" 的處理邏輯
                // 您可以在這裡添加處理 "Next Step" 的相關程式碼
                // 暫時先跳出迴圈結束程式
                clear();
                Menu menu;

                menu.Run();
            } else {
                ++active_field;
            }
        } else if (ch == KEY_UP) {
            if (active_field > 0) {
                --active_field;
            }
        } else if (ch == KEY_DOWN) {
            if (active_field < NUM_FIELDS) {
                ++active_field;
            }
        } else if (ch == KEY_BACKSPACE || ch == 127) {
            if (active_field < NUM_FIELDS && !field_values[active_field].empty()) {
                field_values[active_field].pop_back();
            }
        } else if (isprint(ch) && active_field < NUM_FIELDS) {
            if (field_values[active_field].length() < FIELD_WIDTH) {
                field_values[active_field] += ch;
            }
        } else if (ch == 27) { // 27 是 ESC 鍵的 ASCII 值
            break;
        }
    }

    endwin(); // 結束 ncurses 模式
    return 0;
}
