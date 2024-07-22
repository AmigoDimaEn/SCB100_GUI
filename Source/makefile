#SCB_GUI.exe: GUI_main.cpp
#	g++ -g -pthread -std=c++14 GUI_main.cpp Menu.cpp Barcode.cpp TestAll.cpp IOTest.cpp #Record.cpp SambaClient.cpp -o SCB_GUI -lncurses -ltinfo -lsmbclient -I/usr/include/samba-4.0

CXX = g++
CXXFLAGS = -g -pthread -std=c++14 -I/usr/include/samba-4.0
LDFLAGS = -L/usr/lib/x86_64-linux-gnu -lsmbclient -lncurses -ltinfo

SCB_GUI.exe: GUI_main.cpp Menu.cpp Barcode.cpp TestAll.cpp IOTest.cpp Record.cpp SambaClient.cpp
	$(CXX) $(CXXFLAGS) GUI_main.cpp Menu.cpp Barcode.cpp TestAll.cpp IOTest.cpp Record.cpp SambaClient.cpp -o SCB_GUI $(LDFLAGS)

