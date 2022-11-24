import socket
import rsa

#generate public and private keys
publickey, privatekey = rsa.newkeys(1024)

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('.0.1', 5000))
server_socket.listen(5)

while True:
    client, addr = server_socket.accept()
    print('Connection from', addr)
    #send public key to client
    client.send(pubkey.save_pkcs1())
    print('Public key sent to client')
    #receive public key from client
    client_pubkey = client.recv(1024)
    print('Public key received from client')
    print('Public key: ', client_pubkey)
    