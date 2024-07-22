#ifndef _RECORD_H_
#define _RECORD_H_
#include "../Header/GUI_Class.hpp"
#include <vector>
#include <iostream>
#include <fstream>
#include <string>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <errno.h>
#include <iomanip>
#include <chrono>
#include <ctime>
#include "../Header/SambaClient.hpp"
extern std::vector<std::string> field_values;

class Logger: public Page_Interface {
public:
    Logger();

    void Run(std::string msg);
    
private:
    void write(const vector<string>message);
    void createDirectory();
    std::string logDirectory="/home/nexcobot/Log";
    std::string logFilePath;


};


string GetTime();
extern string g_startTime;
extern string g_endTime;
extern string g_result;
#endif