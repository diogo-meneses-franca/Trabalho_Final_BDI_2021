import java.util.Scanner;
public class circumExercicio {
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        System.out.print("Digite o valor do raio da circunferência: ");
        double raio = input.nextDouble();
        double diametro = raio * 2;
        double comprimento = 2 * Math.PI * raio;
        double area = Math.PI * (raio * raio);
        System.out.printf("O diâmetro da circunferência é: %f", diametro);
        System.out.printf("\nO comprimento da circunferência é %f", comprimento);
        System.out.printf("\nA área da cincunferência é: ", area);
    }
}

/* Escreva um aplicativo que leia a entrada a partir do usuário do raio de um círculo 
como um inteiro e imprima o diâmetro do círculo, circunferência e área utilizando o 
valor do ponto flutuante 3,14159 para . Utilize as técnicas mostradas na Figura 2.7. 
[Observação: você também pode empregar a constante Math.PI predefinida para o valor de .
Essa constante é mais precisa que o valor 3,14159. A classe Math é definida no pacote
java.lang. As classes nesse pacote são importadas automaticamente, portanto, você não 
precisa importar a classe Math para utilizá-la.] 
Adote as seguintes fórmulas (r é o raio): diâmetro = 2r 
circunferência = 2r 
área = r2 */
