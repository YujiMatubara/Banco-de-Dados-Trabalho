from util.controleSGBD import *
from util import valida

# tela de login que chama as funções ligadas ao SGBD
def login(cursor):
    while True:
        print("Digite 1 para login")
        print("Digite 2 para registrar")
        opcao = int(input("Option: "))

        if opcao == 1:
            email = input("Digite seu email: ")
            if not valida.email(email):
                print("Email invalido: O email nao pode ter mais de 255 caracteres\n")
                continue

            paraken = tentativa_login(cursor, email)
            if paraken is not None:
                break

        elif opcao == 2:
            username = input("Digite seu username: ")
            email = input("Digite seu email: ")
            if not valida.email(email):
                print("Email invalido: O email nao pode ter mais de 255 caracteres\n")
                continue
            if not valida.username(username):
                print("Username invalido: o username nao pode ter mais de 100 caracteres\n")
                continue

            paraken = cadastra_login(cursor, username, email)
            if paraken is not None:
                break

    if paraken:
        print(f"Id do usuario: {paraken}")
    else:
        print("nao foi possivel encontrar esse usuario")

    return paraken


# Tela principal que lista informações pertinentes e faz consultas
def main_window(cursor, token):
    while True:
        print("-----------------------------------------------")
        print("Digite 0 para sair")
        print("Digite 1 para ver seus cursos")
        print("Digite 2 para ver sua lista de amigos")
        print("Digite 3 para ver suas conquistas")
        print("Digite 4 para pesquisar cursos")
        print("-----------------------------------------------\n\n")
        opcao = int(input("Option: "))

        # sair do app
        if opcao == 9:
            break
        # listar todos os cursos do usuário
        elif opcao == 1:
            lista_cursos_usuario(cursor, token)
        # imprimir toda a lista de amigos do usuário
        elif opcao == 2:
            lista_amizades_usuario(cursor, token)
        # imprimir todas as conquistas dod usuário ordenadas das mais raras para as menos raras
        elif opcao == 3:
            pass
        # pesquisar um curso novo
        elif opcao == 4:
            nome_curso = input("Digite o nome do curso (SEM ACENTO): ")
            pesquisa_cursos(cursor, nome_curso)

    print("Good bye!!")
