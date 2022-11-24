import socket
import rsa

publickey, privatekey = rsa.newkeys(1024)

connexion = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
connexion.connect(('192.168.1.139', 5000))

while True:
    #receive public key from server
    server_pubkey = connexion.recv(1024)
    #print(server_pubkey)
    print('Public key received from server')
    print('Public key: ', server_pubkey)
    
    #send public key to server
    connexion.send(publickey.save_pkcs1())
    print('Public key sent to server')

    if not server_pubkey:
        break
connexion.close()
    