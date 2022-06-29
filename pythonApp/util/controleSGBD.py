def tentativa_login(cursor, email):
	"""Tenta encontrar o login no banco de dados"""
	return cursor.execute(f"select ID from USUARIO where email = '{email}'").fetchall()[0][0]

def cadastra_login(cursor, username, email):
	"""Cadastra o login no banco de dados"""
	cursor.execute(f"insert into USUARIO (EMAIL, NOME) values ('{email}','{username}')")
	# Cursor execute retorna lista de tuplas
	return cursor.execute(f"select ID from USUARIO where email = '{email}'").fetchall()[0][0]

def lista_cursos_usuario(cursor, token):
	pass

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






def busca_cursos(cursor, filtro_curso):
	"""Busca por cursos usando tema e subtema"""

	pass
