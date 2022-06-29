from util.controleSGBD import *

def login(cursor):
	
	while True:
		print('Digite 1 para login')
		print('Digite 2 para registrar')
		opcao = int(input('Opcao: '))

		if opcao == 1:
			username = input('Digite seu username: ')
			email = input('Digite seu email: ')
			token = tentativa_login(cursor, email)
			if token is not None:
				break
		elif opcao == 2:
			username = input('Digite seu username: ')
			email = input('Digite seu email: ')
			token = cadastra_login(cursor, username, email)
			if token is not None:
				break

	print(f"Id do usuario: {token}")

	return token
