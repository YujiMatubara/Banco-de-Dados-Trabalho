def tentativa_login(cursor, email):
	#Tenta encontrar o login no banco de dados
	sql = """select ID from USUARIO where EMAIL = :userEmail"""
	print(email)
	#Pega e retorna o ID do usuario baseano-se no email
	token = cursor.execute(sql, [email]).fetchall()
	if(token):
		return token[0][0]
	else:
		return 0

def cadastra_login(cursor, username, email):
	#Cadastra o login no banco de dados
	#Cria o novo usuário (com o email e nome passado) no banco de dados
	sql = """insert into USUARIO (EMAIL, NOME) values (:email,:username)"""
	cursor.execute(sql, [email, username])
	#Pega o token desse novo usuário criado
	sql = """select ID from USUARIO where EMAIL = :userEmail"""
	return cursor.execute(sql, [email]).fetchall()[0][0]

def lista_cursos_usuario(cursor, token):
	#Com o ID do usuário, pega todos os cursos já cursados que se juntam com o user e imprime
	sql = """select CURSO.ID, CURSO.TITULO from CURSO join CURSA on CURSO.ID = CURSA.CURSO where CURSA.USUARIO = :userToken"""
	lista_cursos = cursor.execute(sql, [token]).fetchall()
	if(lista_cursos):
		for curso in lista_cursos:
			print("Nome do curso: " + curso[1] + "\n" + "ID do curso: " + str(curso[0]) + "\n")
	else:
		print("Nenhum curso feito/fazendo")
	return

def pesquisa_cursos(cursor, nome_curso):
	#pega a substring correspondente a um curso (ignorando acentos na base de dados)
	nome_curso = "%" + nome_curso.upper() + "%"
	print(nome_curso)
	sql = """select CURSO.ID, CURSO.TITULO from CURSO where upper(CURSO.TITULO) COLLATE LATIN_AI like :nome_curso"""
	lista_cursos = cursor.execute(sql, [nome_curso]).fetchall()
	if(lista_cursos):
		for curso in lista_cursos:
			print("Nome do curso: " + curso[1] + "\n" + "ID do curso: " + str(curso[0]) + "\n")
	else:
		print("Nenhum curso encontrado")
	return

"""
class FiltroCurso:
	def __init__(titulo=None, tema=None, subtema=None, avaliacao=None):
		self.tituo = titulo.upper()
		self.tema = tema.upper()
		self.subtema = subtema.upper()
		self.avaliacao = int(avaliacao)

	def gerar_clausula_where(self):
		clausulas = []

		if titulo is not None:
			clausulas.append(f"upper(titulo) like '%{self.titulo}%'")
		if tema is not None:
			clausulas.append(f"upper(tema) like '%{self.tema}%'")
		if subtema is not None:
			clausulas.append(f"upper(subtema) like '%{self.subterma}%'")
		if avaliacao is not None:
			clausulas.append(f"case qtd_avaliacao when 0 then 0 else  soma_avaliacao / qtd_avaliacao end >= {self.avaliacao}")

		if clausulas: # Test if clausulas is Empty
			return ""
		else:
			return "where " + " and ".join(clausulas)
"""
