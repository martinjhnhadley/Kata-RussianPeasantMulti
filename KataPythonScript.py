import numpy as np
def kataBasic(a,b):
    sgns = np.sign(a)*np.sign(b)
    nextD = abs(a)
    nextM = abs(b)
    multis = [b] if a%2 == 1 else []
    while nextD > 1:
        nextD = int(np.floor(nextD/2))
        nextM = nextM*2
        multis = np.append(multis,nextM) if nextD%2 == 1 else multis
    return int(sgns*sum(multis))