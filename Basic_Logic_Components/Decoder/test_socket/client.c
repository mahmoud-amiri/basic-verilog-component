#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#pragma comment(lib, "Ws2_32.lib")
#define CLOSE_SOCKET closesocket
#define SOCKET_ERROR_CODE WSAGetLastError()
#else
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#define CLOSE_SOCKET close
#define SOCKET_ERROR_CODE errno
#endif

#include "cJSON.h"

#define PORT 5000
#define BUFFER_SIZE 1024

void error_handling(const char *message) {
    perror(message);
    exit(1);
}

int main(int argc, char *argv[]) {
#ifdef _WIN32
    WSADATA wsaData;
    if (WSAStartup(MAKEWORD(2, 2), &wsaData) != 0) {
        error_handling("WSAStartup() error");
    }
#endif

    int sock;
    struct sockaddr_in server_addr;
    char buffer[BUFFER_SIZE];
    int str_len;

    sock = socket(PF_INET, SOCK_STREAM, 0);
    if (sock == -1)
        error_handling("socket() error");

    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1"); // Replace with server IP
    server_addr.sin_port = htons(PORT);

    if (connect(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1)
        error_handling("connect() error");

    // Handshake
    send(sock, "HELLO SERVER", strlen("HELLO SERVER"), 0);
    str_len = recv(sock, buffer, BUFFER_SIZE - 1, 0);
    if (str_len == -1)
        error_handling("recv() error");
    buffer[str_len] = 0;
    if (strcmp(buffer, "HELLO CLIENT") != 0) {
        error_handling("Handshake failed");
    }

    while (1) {
        printf("Enter JSON data to send to server (or type 'exit' to quit): ");
        fgets(buffer, BUFFER_SIZE, stdin);
        buffer[strcspn(buffer, "\n")] = 0; // Remove trailing newline

        if (strcmp(buffer, "exit") == 0)
            break;

        cJSON *json = cJSON_Parse(buffer);
        if (json == NULL) {
            fprintf(stderr, "Invalid JSON format. Please try again.\n");
            continue;
        }

        char *json_str = cJSON_Print(json);
        send(sock, json_str, strlen(json_str), 0);
        free(json_str);
        cJSON_Delete(json);

        str_len = recv(sock, buffer, BUFFER_SIZE - 1, 0);
        if (str_len == -1)
            error_handling("recv() error");
        buffer[str_len] = 0;

        cJSON *response_json = cJSON_Parse(buffer);
        if (response_json == NULL) {
            fprintf(stderr, "Error parsing JSON response\n");
            continue;
        }

        printf("Received from server: %s\n", cJSON_Print(response_json));
        cJSON_Delete(response_json);
    }

    CLOSE_SOCKET(sock);

#ifdef _WIN32
    WSACleanup();
#endif

    return 0;
}
