package Capitulo3;
import java.util.Scanner;
public class AccountTest {
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);

        Account myAccount = new Account(); //cria o objeto Account e atribui a myAccount
        System.out.printf("Initial name is: %s%n%n", myAccount.getName());

        System.out.println("Please enter the name: ");
        String theName = input.nextLine();
        myAccount.setName(theName);
        System.out.println(); //gera como saida uma linha em branco

        System.out.printf("Name in objetct myAccount is: %s%n%n", myAccount.getName());
    }
}
