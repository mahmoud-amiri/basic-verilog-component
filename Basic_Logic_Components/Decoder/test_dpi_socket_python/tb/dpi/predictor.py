from client_api import SocketClient

if __name__ == "__main__":
    host = "localhost"
    port = 8081

    client = SocketClient(host, port)
    if client.handshake():
        print("Handshake successful")
        while True:
            received_data = client.receive_large_data()
            if received_data["input"]:
                try:
                    input_value = int(received_data["input"])
                    data = input_value + 1  # Note: using ** for exponentiation
                    print("Processed data:", data)
                except ValueError:
                    print("Error: received_data['input'] is not a valid integer")
                    data = 1
            else:
                print("Error: received_data['input'] is empty")
                data = 1    


            data = {"output": str(data)}
            print("send data:", data["output"])
            client.send_large_data(data)

        # Example to receive data
        
    else:
        print("Handshake failed")

    # client.close()