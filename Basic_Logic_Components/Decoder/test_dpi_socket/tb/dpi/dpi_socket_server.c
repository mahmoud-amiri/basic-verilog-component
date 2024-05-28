#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include "svdpi.h"

#define PORT 12345
#define BUFFER_SIZE 1024

int server_socket, client_socket;
struct sockaddr_in server_addr, client_addr;
socklen_t client_len = sizeof(client_addr);

void dpi_socket_server_init() {
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket < 0) {
        perror("Error opening socket");
        exit(1);
    }

    memset((char *) &server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    if (bind(server_socket, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("Error binding socket");
        close(server_socket);
        exit(1);
    }

    listen(server_socket, 5);
}

void dpi_socket_server_accept() {
    client_socket = accept(server_socket, (struct sockaddr *) &client_addr, &client_len);
    if (client_socket < 0) {
        perror("Error accepting connection");
        close(server_socket);
        exit(1);
    }
}

void dpi_socket_server_send(const char* message) {
    write(client_socket, message, strlen(message));
}

void dpi_socket_server_receive(char* buffer) {
    int n = read(client_socket, buffer, BUFFER_SIZE - 1);
    if (n < 0) {
        perror("Error reading from socket");
    }
    buffer[n] = '\0';
}

void dpi_socket_server_close() {
    close(client_socket);
    close(server_socket);
}
