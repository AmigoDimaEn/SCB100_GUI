#include <libsmbclient.h>
#include <cstdio>
#include <cstring>
#include <cerrno>
#include <fcntl.h>

int main() {
    SMBCCTX *ctx;
    int fd;
    const char *file_url = "smb://R067-2204017/SMB/123";
    mode_t mode = 0644;

    // 初始化 libsmbclient
    if (smbc_init(NULL, 0) == -1) {
        perror("初始化 libsmbclient 失败");
        return 1;
    }

    // 打开远程文件
    fd = smbc_open(file_url, O_WRONLY | O_CREAT | O_TRUNC, mode);
    if (fd < 0) {
        perror("打开远程文件失败");
        printf("errno: %d\n", errno);
        return 1;
    }

    // 关闭文件
    smbc_close(fd);

    printf("文件操作成功\n");
    return 0;
}

