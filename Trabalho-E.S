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

void imprime(NOH *lista)
{
    if (lista == NULL)
    {
        printf("\nLISTA VAZIA\n");
    }
    else
    {
        while (lista != NULL)
        {
            printf("-> %s\n", lista->nome);
            lista = lista->prox;
        }
    }
}

int remover_inicio(NOH **lista)
{
    if (*lista == NULL)
    {
        printf("Lista vazia. Não há elemento para remover.\n");
        return -1;
    }
    NOH *tmp = *lista;
    *lista = (*lista)->prox;
    free(tmp->nome);
    free(tmp);
    return 1;
}

int remove_valor(NOH **lista, const char *buscado)
{
    if (*lista == NULL)
    {
        printf("Lista vazia\n");
        return -1;
    }

    if (strcmp((*lista)->nome, buscado) == 0)
    {
        NOH *tmp = *lista;
        *lista = (*lista)->prox;
        free(tmp->nome);
        free(tmp);
        return 1;
    }

    NOH *atual = *lista;
    NOH *penultimo = NULL;
    while (atual != NULL && strcmp(atual->nome, buscado) != 0)
    {
        penultimo = atual;
        atual = atual->prox;
    }

    if (atual == NULL)
    {
        printf("Elemento %s não encontrado.\n", buscado);
        return -1;
    }

    penultimo->prox = atual->prox;
    free(atual->nome);
    free(atual);
    return 1;
}

int atualiza_valor(NOH *lista, const char *antigo, const char *novo)
{
    while (lista != NULL)
    {
        if (strcmp(lista->nome, antigo) == 0)
        {
            free(lista->nome);
            lista->nome = malloc(strlen(novo) + 1);
            strcpy(lista->nome, novo);
            return 1;
        }
        lista = lista->prox;
    }
    printf("Elemento %s não encontrado.\n", antigo);
    return -1;
}

void liberar_lista(NOH **lista)
{
    while (*lista != NULL)
    {
        remover_inicio(lista);
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
        getchar(); // Limpar buffer do teclado

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
            fgets(nome, sizeof(nome), stdin);
            nome[strcspn(nome, "\n")] = '\0';
            printf("Digite o novo nome: ");
            fgets(novo_nome, sizeof(novo_nome), stdin);
            novo_nome[strcspn(novo_nome, "\n")] = '\0';
            atualiza_valor(lista, nome, novo_nome);
            break;

        case 4:
            printf("Digite o nome a ser removido: ");
            fgets(nome, sizeof(nome), stdin);
            nome[strcspn(nome, "\n")] = '\0';
            remove_valor(&lista, nome);
            break;

        case 5:
            liberar_lista(&lista);
            printf("Saindo...\n");
            break;

        default:
            printf("Opção inválida. Tente novamente.\n");
        }
    } while (opcao != 5);

    return 0;
}