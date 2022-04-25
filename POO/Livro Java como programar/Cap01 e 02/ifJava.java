import java.util.Scanner;
public class ifJava {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int valor1;
        int valor2;
        valor1 = input.nextInt();
        valor2 = input.nextInt();
        if (valor1 > valor2)
            System.out.printf("%d > %d", valor1, valor2);
        if (valor1 == valor2)
            System.out.printf("%d == %d", valor1, valor2);
        if (valor2 > valor1)
            System.out.printf("%d > %d ", valor2, valor1);

    }
}
