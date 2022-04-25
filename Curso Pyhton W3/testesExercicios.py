def mult(x):
    while x >0 and x <=9:
        for i in range(0,x):
            for n in range(0,i):
                j = i*n
                print(j)
                if j >= i*(i+1):
                    break
    while x < 0 or x > 9:
        x = int(input("Informe o valor de x: "))

mult(5)
