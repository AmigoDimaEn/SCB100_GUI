#include "../Header/Record.hpp"

    string GetTime()
    {
    // 獲取當前時間點
    auto now = std::chrono::system_clock::now();

    // 將時間點轉換為時間戳（秒）
    auto now_time_t = std::chrono::system_clock::to_time_t(now);

    // 將時間戳轉換為當前本地時間的結構體
    std::tm* now_tm = std::localtime(&now_time_t);

    // 使用 stringstream 和 iomanip 格式化時間
    std::stringstream ss;
    ss << std::put_time(now_tm, "%Y%m%d%H%M%S");

    // 輸出格式化後的時間
    return ss.str();
    
    }
    Logger::Logger()
    {

    }
    void Logger::write(const vector<string>message) 
    {
        std::ofstream logFile;
        logFile.open(logFilePath, std::ios::app); // 以追加模式開啟檔案
        if (logFile.is_open()) {
            for(auto msg : message)
            {
            logFile << msg << std::endl;

            }
            logFile.close();
        } 
    }

    void Logger::createDirectory()     
    {
        struct stat info;

        // 檢查資料夾是否已存在
        if (stat(logDirectory.c_str(), &info) != 0) {
            // 資料夾不存在，嘗試創建
            if (mkdir(logDirectory.c_str(), 0755) != 0 && errno != EEXIST) {
                std::cerr << "無法創建資料夾: " << logDirectory << std::endl;
                throw std::runtime_error("無法創建資料夾");
            }
            std::cout << "資料夾創建成功: " << logDirectory << std::endl;
        } else if (!(info.st_mode & S_IFDIR)) {
            // 目標路徑存在，但不是資料夾
            std::cerr << "目標路徑已存在，但不是資料夾: " << logDirectory << std::endl;
            throw std::runtime_error("目標路徑已存在，但不是資料夾");
        }
    }

    void Logger::Run(std::string msg)
    {
        vector<string> v_msg;
        std::string logFileName = field_values[2] +"_"+ g_endTime +"_"+ "PT" +"_"+ g_result;
        std::string mac;
        ShellCmd("ifconfig |grep enp2s0 |awk '{print $5}' | sed 's/://g'",mac);
        std::string title[8] = {
        field_values[2], //SN
        field_values[0], //tester id
        field_values[1], //Station id
        g_startTime,
        g_endTime,
        g_result,
        mac,
        "1.2.1",
        };
        for(int cnt = 0;cnt < 8; cnt++)
        {
            v_msg.push_back(title[cnt]);
        }
        v_msg.push_back(msg);

        createDirectory();
        logFilePath = logDirectory + "/" + logFileName;
        write(v_msg);

        upload(logDirectory,logFileName);

    }