import hashlib
import time

ogstr = input("Enter String: ")
encoded = ogstr.encode() # convert to binary 
oghash = hashlib.sha256(encoded) # SHA 256 object
oghashstr = str(oghash.hexdigest()) # hash string 
x = 0; 
start = time.time()
while(1):
    x += 1
    strx = str(x)
    curstr = ogstr + strx 
    encoded = curstr.encode()
    curhash = hashlib.sha256(encoded)
    curhashstr = str(curhash.hexdigest())
    for i in range(5):
        if(curhashstr[i] != '0'):
            break; 
    else:
        t = "00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
        if(curhashstr != t):
            print(f'Required number: {x}')
            print(f'SHA 256 hash of the string "{curstr}" is {curhashstr}')
            print(f'Time taken: {time.time() - start} seconds') 
            break


