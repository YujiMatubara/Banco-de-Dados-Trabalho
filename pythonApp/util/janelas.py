from util.controleSGBD import *

def login(cursor):
	
	while True:
		print('Digite 1 para login')
		print('Digite 2 para registrar')
		opcao = int(input('Option: '))

		if opcao == 1:
			email = input('Digite seu email: ')
			paraken = tentativa_login(cursor, email)
			if paraken is not None:
				break
		elif opcao == 2:
			username =  input('Digite seu username: ')
			email =  input('Digite seu email: ')
			paraken = cadastra_login(cursor, username, email)
			if paraken is not None:
				break

	if paraken:
		print(f"Id do usuario: {paraken}")
	else:
		print("nao foi possivel encontrar esse usuario")

	return paraken

def main_window(cursor, token):

	while True:
		print('-----------------------------------------------')
		print('Digite 1 para ver seus cursos')
		print('Digite 2 para ver sua lista de amigos')
		print('Digite 3 para ver suas conquistas')
		print('Digite 4 para pesquisar cursos')
		print('Digite 5 para ')
		print('Digite 6 para ')
		print('Digite 7 para ')
		print('Digite 8 para ')
		print('Digite 9 para sair')
		print('-----------------------------------------------\n\n')
		opcao = int(input('Option: '))

		if opcao == 1:
			lista_cursos_usuario(cursor, token)
		elif opcao == 2:
			pass
		elif opcao == 3:
			pass
		elif opcao == 4:
			nome_curso =  input('Digite o nome do curso (SEM ACENTO): ')
			pesquisa_cursos(cursor, nome_curso)
		elif opcao == 9:
			break

	print("Good bye!!")