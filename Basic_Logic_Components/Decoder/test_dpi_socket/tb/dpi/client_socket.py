import socket

def main():
    server_address = ('localhost', 12345)
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect(server_address)

    try:
        while True:
            message = input("Enter message to send to server: ")
            client_socket.sendall(message.encode('utf-8'))
            data = client_socket.recv(1024)
            print(f"Received from server: {data.decode('utf-8')}")
            if message == "exit":
                break
    finally:
        client_socket.close()

if __name__ == "__main__":
    main()
