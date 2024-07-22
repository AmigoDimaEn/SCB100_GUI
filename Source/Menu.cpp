#include "../Header/Menu.hpp"


Menu::Menu()
{

        initscr();
        cbreak();
        nonl();
        noecho();
        intrflush(stdscr, FALSE);
        keypad(stdscr, TRUE);
         attron(A_REVERSE);
        mvaddstr( LINES/2, COLS/4, "[ Scan Barcode   ]" ); // Y, X, string
        attroff(A_REVERSE);
        mvaddstr( LINES/2 + 2, COLS/4, "[ SCB100 Test    ]" );
        mvaddstr( LINES/2 + 4, COLS/4, "[ SCB100-IO Test ]" );
         mvaddstr( LINES/2 + 6, COLS/4, "Pre Step");
        refresh();


}

ButtonState Menu::Run()
{
    //box(win,'|','-');
    ButtonState state = Barcode;   

    int ch;
    while(true)
    {

        ch = getch();
        if(ch == KEY_DOWN)
        {
            if(state == Barcode){
                state = MainBoard;
            } else if(state == MainBoard){
                state = IO_Board;
            } else if(state == IO_Board){
                state = PreState;
            }
        }
        else if(ch == KEY_UP)
        {
            if(state == MainBoard){
                state = Barcode;
            } else if(state == IO_Board){
                state = MainBoard;
            } else if(state == PreState){
                state = IO_Board;
            }
        }
        else if((ch == 10) || (ch == 13))
        {
            if(state == Barcode)        
            {
                Barcode_c c_barcode;
                c_barcode.Run();

            } 
            else if(state == MainBoard)
            {
                TestAll_c c_allTest;
                c_allTest.Run();
            } 
            else if(state == IO_Board)
            {
                IOTest_c c_ioTest;
                c_ioTest.Run();
            }
            else if(state == PreState) 
            {
                break;
            }
        }
        ScreenButton(state);
    }
    
    return state;
}
int Menu::ScreenButton(ButtonState state)
{
    switch(state)
    {
      case Barcode:
        attron(A_REVERSE);

        mvaddstr( LINES/2, COLS/4, "[ Scan Barcode   ]" );

        attroff(A_REVERSE);
        mvaddstr( LINES/2 + 2, COLS/4, "[ SCB100 Test    ]" );
        mvaddstr( LINES/2 + 4, COLS/4, "[ SCB100-IO Test ]" );
        mvaddstr( LINES/2 + 6, COLS/4, "Pre Step");
      break;
      case MainBoard: 
        attron(A_REVERSE);
        mvaddstr( LINES/2 + 2, COLS/4, "[ SCB100 Test    ]" );
        attroff(A_REVERSE);
        mvaddstr( LINES/2, COLS/4, "[ Scan Barcode   ]" ); // Y, X, string
        mvaddstr( LINES/2 + 4, COLS/4, "[ SCB100-IO Test ]" );
        mvaddstr( LINES/2 + 6, COLS/4, "Pre Step");
      break;
      case IO_Board:
        attron(A_REVERSE);
        mvaddstr( LINES/2 + 4, COLS/4, "[ SCB100-IO Test ]" );
        attroff(A_REVERSE);
        mvaddstr( LINES/2, COLS/4, "[ Scan Barcode   ]" ); // Y, X, string
        mvaddstr( LINES/2 + 2, COLS/4, "[ SCB100 Test    ]" );
        mvaddstr( LINES/2 + 6, COLS/4, "Pre Step");
      break;
      case PreState:
        attron(A_REVERSE);
           mvaddstr( LINES/2 + 6, COLS/4, "Pre Step");    
        attroff(A_REVERSE);
        mvaddstr( LINES/2, COLS/4, "[ Scan Barcode   ]" ); // Y, X, string
        mvaddstr( LINES/2 + 2, COLS/4, "[ SCB100 Test    ]" );
     mvaddstr( LINES/2 + 4, COLS/4, "[ SCB100-IO Test ]" );
      break;

    }
        refresh();

}
