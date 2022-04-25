#include <stdio.h>
#include <conio.h>
int main()
{
	float g, a, d, litros, total;
	int opcao;
	printf("Escolha o combustível: \n");
	printf("1 - Gasolina \n");
	printf("2 - Álcool \n");
	printf("3 - Diesel \n");
	printf("Digite a opção: \n");
	scanf ("%i", &opcao);
	opcao = getch();
	printf("Quantos litros? \n");
	scanf (%f, &litros);
	litros = getch();
	g = 7.10;
	a = 6.05;
	d = 6.10;
	Switch(opcao)
		{
		case 1:
			total = litros*g;
			printf("Valor total da compra R$: %f\n", total);
			break;
		case 2:
			total = litros * a;
			printf("Valor total da compra R$: %f\n", total);
			break;
		case 3:
			total = litros*d;
			printf("Valor total da compra R$: %f\n", total);
			break;
		default:
			printf("Opção inválida!")
		 
	}
		
}
