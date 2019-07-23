import numpy as np
import matplotlib.pyplot as plt


def pprint():
    plt.figure()
    for i in range(4):
        for j in range(5):
            num = i * 5 + j + 1
            plt.subplot(4, 5, num)
            a = np.array(np.load("./outtem/out%i.npy" % num), dtype=np.float32)
            plt.plot(a[:-1, 0], a[:-1, 1], '-', color='g')
            plt.plot(a[-1, 0], a[-1, 1], '-x', color='b')

            b = np.linspace(0, 1*np.pi, 100)
            xs = np.cos(b)*1.5
            ys = np.sin(b)*1.5
            plt.plot(xs, ys, color='r')

    plt.show()

if __name__=="__main__":
    pprint()



