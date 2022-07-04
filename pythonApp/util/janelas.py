from util.controleSGBD import *
from util import valida

# tela de login que chama as funções ligadas ao SGBD
def login(cursor):
    while True
        print("-" * 48)
        print("Digite 1 para login")
        print("Digite 2 para registrar")
        print("-" * 48)
        print("\n")

        opcao = int(input("Option: "))

        if opcao == 1:
            email = input("Digite seu email: ")
            if not valida.email(email):
               continue

            paraken = tentativa_login(cursor, email)
            if paraken is not None:
                break

        elif opcao == 2:
            username = input("Digite seu username: ")
            if not valida.username(username):          
                continue

            email = input("Digite seu email: ")
            if not valida.email(email):
                continue

            paraken = cadastra_login(cursor, username, email)
            if paraken is not None:
                break
    
    print()
    if paraken:
        print(f"Id do usuario: {paraken}")
    else:
        print("nao foi possivel encontrar esse usuario")
    print()

    return paraken


# Tela principal que lista informações pertinentes e faz consultas
def main_window(cursor, token):
    while True:
        print("-" * 48)
        print("Digite 0 para sair")
        print("Digite 1 para ver seus cursos")
        print("Digite 2 para ver sua lista de amigos")
        print("Digite 3 para ver suas conquistas")
        print("Digite 4 para pesquisar cursos")
        print("-" * 48)
        print("\n")

        opcao = int(input("Option: "))

        # sair do app
        if opcao == 0:
            break
        # listar todos os cursos do usuário
        elif opcao == 1:
            lista_cursos_usuario(cursor, token)
        # imprimir toda a lista de amigos do usuário
        elif opcao == 2:
            lista_amizades_usuario(cursor, token)
        # imprimir todas as conquistas dod usuário ordenadas das mais raras para as menos raras
        elif opcao == 3:
            lista_conquistas_usuario(cursor, token)
        # pesquisar um curso novo
        elif opcao == 4:
            nome_curso = input("Digite o nome do curso (SEM ACENTO): ")
            if valida.curso_titulo(nome_curso):
                pesquisa_cursos(cursor, nome_curso)

    print("Good bye!!")
