#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>
#include "svdpi.h"

#pragma comment(lib, "ws2_32.lib")

#define PORT 12345
#define BUFFER_SIZE 1024

SOCKET server_socket, client_socket;
struct sockaddr_in server_addr, client_addr;
int client_len = sizeof(client_addr);

void dpi_socket_server_init() {
    WSADATA wsa;
    if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0) {
        printf("Failed. Error Code : %d", WSAGetLastError());
        exit(EXIT_FAILURE);
    }

    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == INVALID_SOCKET) {
        printf("Could not create socket : %d", WSAGetLastError());
        WSACleanup();
        exit(EXIT_FAILURE);
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    if (bind(server_socket, (struct sockaddr*)&server_addr, sizeof(server_addr)) == SOCKET_ERROR) {
        printf("Bind failed with error code : %d", WSAGetLastError());
        closesocket(server_socket);
        WSACleanup();
        exit(EXIT_FAILURE);
    }

    listen(server_socket, 3);
}

void dpi_socket_server_accept() {
    client_socket = accept(server_socket, (struct sockaddr*)&client_addr, &client_len);
    if (client_socket == INVALID_SOCKET) {
        printf("accept failed with error code : %d", WSAGetLastError());
        closesocket(server_socket);
        WSACleanup();
        exit(EXIT_FAILURE);
    }
}

void dpi_socket_server_send(const char* message) {
    send(client_socket, message, strlen(message), 0);
}

void dpi_socket_server_receive(char* buffer) {
    int n = recv(client_socket, buffer, BUFFER_SIZE - 1, 0);
    if (n == SOCKET_ERROR) {
        printf("recv failed with error code : %d", WSAGetLastError());
    }
    buffer[n] = '\0';
}

void dpi_socket_server_close() {
    closesocket(client_socket);
    closesocket(server_socket);
    WSACleanup();
}
