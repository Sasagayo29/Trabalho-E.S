#include <stdlib.h>
#include <string.h>

typedef struct NOH
{
    char *nome;
    struct NOH *prox;
} NOH;

int insere_pos(NOH **lista, int indice, const char *nome)
{
    NOH *aux = *lista;
    NOH *novo = malloc(sizeof(NOH));
    novo->nome = malloc(strlen(nome) + 1);
    strcpy(novo->nome, nome);

    if (indice == 0)
    {
        novo->prox = *lista;
        *lista = novo;
        return 1;
    }

    while (aux->prox != NULL && indice > 1)
    {
        indice--;
        aux = aux->prox;
    }
    novo->prox = aux->prox;
    aux->prox = novo;
    return 1;
}

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
            fgets(nome, sizeof(nome), stdin);
            nome[strcspn(nome, "\n")] = '\0'; // Remover o caractere de nova linha
            printf("Digite a posição para inserir (0 para início): ");
            scanf("%d", &pos);
            getchar();
            insere_pos(&lista, pos, nome);

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
