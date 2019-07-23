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

            b = np.linspace(0, np.pi, 100)
            b[25:50] = b[25:50] + np.pi / 4
            b[50:75] = b[50:75] + np.pi / 4 * 2
            b[75:100] = b[75:100] + np.pi / 4 * 3
            xs = np.cos(b)
            ys = np.sin(b)
            plt.scatter(xs, ys, color='r')

    plt.show()

if __name__=="__main__":
    pprint()



