#include "samba-4.0/libsmbclient.h"
#include "../Header/SambaClient.hpp"
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
void get_auth_data(const char *srv, const char *shr, char *wg, int wglen, char *un, int unlen, char *pw, int pwlen) {
    // 填充工作组、用户名和密码
    snprintf(wg, wglen, "WORKGROUP");  // 可以设置为空或实际工作组
    snprintf(un, unlen, "nexcom/dimalee");  // 用户名
    snprintf(pw, pwlen, "Amigo_0412");  // 密码
}
int upload(string path, string fileName) {
    SMBCCTX *ctx;
    int remote_file;
    int local_file;
    string remote_server = "smb://R067-2204017/SMB/";
    string localFilePath = path + "/" + fileName;
    string remoteFilePath = remote_server + fileName;
    const char *workgroup = "WORKGROUP";
    const char *user = "nexcom/dimalee";
    const char *password = "Amigo_0412";
    smbc_bool use_kerberos = false;
    const char *signing_state = "auto";
    mode_t mode = 0666;  // 确保权限模式合理
    // 初始化 libsmbclient 上下文
    ctx = smbc_new_context();
    if (!ctx) {
        return 1;
    }
    // 設置 SMB/CIFS 選項和上下文
    smbc_option_set(ctx, "user", user);
    smbc_option_set(ctx, "workgroup", workgroup);
    smbc_option_set(ctx, "password", password);
    smbc_option_set(ctx, "use kerberos", use_kerberos ? "1" : "0");
    smbc_option_set(ctx, "signing state", signing_state);

    int ret = smbc_init(get_auth_data,0);
    if (ret != 0) 
    {
        smbc_free_context(ctx, 1);
        return 1;
    }
       
  int dir = smbc_opendir(remote_server.c_str());
    if (dir < 0) {
        fprintf(stderr, "无法打开远程目录。错误: %s\n", strerror(errno));
        smbc_free_context(ctx, 1);
        return 1;
    }
    // 打開本地文件
    local_file = open(localFilePath.c_str(), O_RDONLY);
    if (local_file < 0) {
        smbc_free_context(ctx, 1);
        return 1;
    }

    // 打開（如果不存在則創建）遠程文件
    remote_file = smbc_open(remoteFilePath.c_str(), O_RDWR | O_CREAT, mode);
    if (remote_file < 0) {
        printf("errno: %d\n", errno);
    }

    // 讀取本地文件並寫入到遠程文件
    char buffer[4096];
    ssize_t bytes_read, bytes_written;
    while ((bytes_read = read(local_file, buffer, sizeof(buffer))) > 0) {
        bytes_written = smbc_write(remote_file, buffer, bytes_read);
        if (bytes_written != bytes_read) {
            close(local_file);
            smbc_close(remote_file);
            smbc_free_context(ctx, 1);
            return 1;
        }
    }

    // 關閉文件並清理 libsmbclient 上下文
     close(local_file);
    smbc_close(remote_file);
    smbc_free_context(ctx, 1);

    return 0;
}