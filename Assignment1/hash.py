import hashlib
import time

ogstr = 'Atur'
x = 0; 
start = time.time()
while(1):
    x += 1
    strx = str(x)
    curstr = ogstr + strx 
    curstr_encoded = curstr.encode()
    hash = hashlib.sha256(curstr_encoded)
    hashstr = str(hash.hexdigest())
    for i in range(5):
        if(hashstr[i] != '0'):
            break; 
    else:
        t = "00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
        if(hashstr != t):
            print(f'Required number: {x}')
            print(f'SHA 256 hash of the string "{curstr}" is {hashstr}')
            print(f'Time taken: {time.time() - start} seconds') 
            break


