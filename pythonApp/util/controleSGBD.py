def tentativa_login(cursor, email):
    # Tenta encontrar o login no banco de dados
    sql = "select ID from USUARIO where EMAIL = :userEmail"
    print(email)
    # Pega e retorna o ID do usuario baseano-se no email
    token = cursor.execute(sql, [email]).fetchall()
    if token:
        return token[0][0]
    else:
        return 0


def cadastra_login(cursor, username, email):
    # Cadastra o login no banco de dados
    # Cria o novo usuário (com o email e nome passado) no banco de dados
    sql = "insert into USUARIO (EMAIL, NOME) values (:email,:username)"
    cursor.execute(sql, [email, username])
    # Pega o token desse novo usuário criado
    sql = "select ID from USUARIO where EMAIL = :userEmail"
    return cursor.execute(sql, [email]).fetchall()[0][0]


def lista_cursos_usuario_(cursor, token):
    # Com o ID do usuário, pega todos os cursos já cursados que se juntam com o user e imprime
    sql = "select CURSO.ID, CURSO.TITULO from CURSO join CURSA on CURSO.ID = CURSA.CURSO where CURSA.USUARIO = :userToken"
    lista_cursos = cursor.execute(sql, userToken=token).fetchall()
    if lista_cursos:
        for nome_curso, id_curso in lista_cursos:
            print(f"Nome do curso: {nome_curso}\nID do curso: {id_curso}\n")
    else:
        print("Nenhum curso feito/fazendo")
    return

def lista_cursos_usuario(cursor, token):
    def avaliacao_to_str(val : int) -> str:
        return ("*" * val) + (" " * (5 - val))

    def imprime_curso(titulo, tema, subtema, avaliacao):
        string = "[{avaliacao}] {titulo} \t {tema}: {subtema}".format(
            avaliacao=avaliacao_to_str(avaliacao),
            titulo=titulo,
            tema=tema,
            subtema=subtema
        )
        print(string)


    # Com o ID do usuário, pega todos os cursos já cursados que se juntam com o user e imprime
    sql = "select CURSO.TITULO, CURSO.TEMA, CURSO.SUB_TEMA, CURSA.PROGRESSO, CURSA.AVALIACAO from CURSO join CURSA on CURSO.ID = CURSA.CURSO where CURSA.USUARIO = :userToken"
    lista_cursos = cursor.execute(sql, userToken=token).fetchall()
    if lista_cursos:
        # 'CONCLUIDO' OR PROGRESSO = 'ABANDONADO'
        andamento = [i for i in lista_cursos if i[3] == 'EM ANDAMENTO']
        concluido = [i for i in lista_cursos if i[3] == 'CONCLUIDO']
        planejado = [i for i in lista_cursos if i[3] == 'PLANEJADO']
        abandonado =  [i for i in lista_cursos if i[3] == 'ABANDONADO']

        if andamento:
            print("Cursos em andamento: ")
            for titulo, tema, subtema, _, avaliacao in andamento:
                imprime_curso(titulo, tema, subtema, avaliacao)
            print()
        if concluido:
            print("Cursos concluidos: ")
            for titulo, tema, subtema, _, avaliacao in concluido:
                imprime_curso(titulo, tema, subtema, avaliacao)
            print()
        if planejado: 
            print("Cursos planejados: ")
            for titulo, tema, subtema, _, avaliacao in planejado:
                imprime_curso(titulo, tema, subtema, avaliacao)
            print()
        if abandonado:
            print("Cursos abandonados: ")
            for titulo, tema, subtema, _, avaliacao in abandonado:
                imprime_curso(titulo, tema, subtema, avaliacao)
            print()

    else:
        print("Nenhum curso feito/fazendo")




def lista_amizades_usuario(cursor, token):
    # Com o ID do usuario, pega todos os amigos que ele tem
    sql = "select AMIZADE.DATA_INICIO_AMIZADE, AMIGO.NOME, AMIGO.NIVEL_DE_CONQUISTA from USUARIO join AMIZADE on USUARIO.ID = AMIZADE.USUARIO join USUARIO AMIGO on AMIGO.ID = AMIZADE.AMIGO where USUARIO.ID = :userToken"
    lista_amigos = cursor.execute(sql, userToken=token).fetchall()
    if lista_amigos:
        for data_inicio, nome, nivel_conquista in lista_amigos:
            print(f"{nome}\tNivel:{nivel_conquista}\tdesde {data_inicio}")
    else:
        print("Você ainda nao fez nenhuma amizade ainda :(")

def lista_conquistas_usuario(cursor, token):
    # Com o ID do usuario, pega todas as conquistas que ele tem
    sql = "select NIVEL_DE_CONQUISTA from USUARIO where USUARIO.ID = :userToken"
    nivel = cursor.execute(sql, userToken=token).fetchall()[0][0]
    sql = "select C.NOME, C.NIVEL from DESBLOQUEIA_CONQUISTA D join CONQUISTAS C on D.NOME_CONQUISTA = C.NOME where D.USUARIO = :userToken"
    lista_conquistas = cursor.execute(sql, userToken=token).fetchall()
    if lista_conquistas:
        print(f"Voce tem {nivel} pontos")
        print()
        for conquista_nome, conquista_nivel in lista_conquistas:
            print(f"{conquista_nivel:8} - {conquista_nome}")
    else:
        print("Tente desbloquear alguma conquista, como por exemplo concluir a criacao de sua conta")



def pesquisa_cursos(cursor, nome_curso):
    # pega a substring correspondente a um curso (ignorando acentos na base de dados)
    nome_curso = "%" + nome_curso.upper() + "%"
    print(nome_curso)
    sql = "select CURSO.ID, CURSO.TITULO from CURSO where upper(CURSO.TITULO) COLLATE LATIN_AI like :nome_curso"
    lista_cursos = cursor.execute(sql, [nome_curso]).fetchall()
    if lista_cursos:
        for curso in lista_cursos:
            print(f"Nome do curso: {curso[1]}\nID do curso: {curso[0]}\n")
    else:
        print("Nenhum curso encontrado")
    return
