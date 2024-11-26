#include <stdlib.h>
#include <string.h>

typedef struct NOH
{
    char *nome;
    struct NOH *prox;
} NOH;

void imprime(NOH* lista){

    if(lista==NULL)
        printf("Lista Vazia!");
    else{
        while(lista->prox!=NULL)
            printf("%s",lista->nome);
            lista=lista->prox;
    }




}

int main()
{
    NOH *lista = NULL;
    int opcao;
    char nome[50], novo_nome[50];
    int pos;

    do
    {
        printf("\n=== MENU ===\n");
        printf("1. Inserir Nome (Create)\n");
        printf("2. Listar Nomes (Read)\n");
        printf("3. Atualizar Nome (Update)\n");
        printf("4. Remover Nome (Delete)\n");
        printf("5. Sair\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);
        getchar();
        switch (opcao)
        {
        case 1:
            printf("Digite o nome a ser inserido: ");
            scanf("%s",lista->nome);

            break;
        case 2:
            printf("\nLista de nomes:\n");
            imprime(lista);
            break;
        case 3:
            printf("Digite o nome a ser atualizado: ");
            scanf("%s",lista->nome);
            break;
        case 4:
            printf("Digite o nome a ser removido: ");
            scanf("%s",lista->nome);
            break;
        case 5:
            printf("Saindo...\n");
            break;
        default:
            printf("Opção inválida. Tente novamente.\n");
        }
    } while (opcao != 5);
    return 0;
}
