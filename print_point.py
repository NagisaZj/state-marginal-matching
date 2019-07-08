import numpy as np
import matplotlib.pyplot as plt


if __name__=="__main__":


    plt.figure()
    for i in range(4):
        for j in range(5):
            num = i*5+j+1
            plt.subplot(4,5,num)
            a = np.array(np.load("./outtem/out%i.npy"%num), dtype=np.float32)
            plt.plot(a[:-1, 0], a[:-1, 1], '-', color='g')
            plt.plot(a[-1, 0], a[-1, 1], '-x', color='b')

            b = np.linspace(0,np.pi,100)
            xs = np.cos(b)
            ys = np.sin(b)
            plt.plot(xs,ys,color='r')

    plt.show()
