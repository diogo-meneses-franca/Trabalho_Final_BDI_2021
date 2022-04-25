import java.rmi.server.SocketSecurityException;
import java.util.Scanner;
public class Inicio {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        System.out.println("Digite o nome do estudante: ");
        Estudante estudante = new Estudante();
        estudante.nome = input.nextLine();
    }
}
