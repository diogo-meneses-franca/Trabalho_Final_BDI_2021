import java.util.Scanner;
public class exercicios {
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        System.out.print("Digite o primeiro inteiro:");
        int x = input.nextInt();
        System.out.print("Digite o segundo inteiro:");
        int y = input.nextInt();
        System.out.print("Digite o terceiro inteiro:");
        int z = input.nextInt();
        int result = x*y*z;
        System.out.printf("%s%d", "Product is: ", result);
    }
}
