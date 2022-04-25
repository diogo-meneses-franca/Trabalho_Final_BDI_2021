import java.util.Scanner;
public class Soma1 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int numero1;
        int numero2;
        int soma;
        System.out.println("Digite o primeiro inteiro: ");
        numero1 = input.nextInt();
        System.out.println("Digite o segundo inteiro: ");
        numero2 = input.nextInt();
        soma = numero1 + numero2;
        System.out.printf("A soma é %d%n", soma);
    }
}
