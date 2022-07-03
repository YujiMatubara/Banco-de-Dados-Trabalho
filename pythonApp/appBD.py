# pip install cx-Oracle
# abre a janela de ambientes em python e seleciona a que tem o pacote instalado
# https://stackoverflow.com/questions/72015723/databaseerror-dpi-1047-cannot-locate-a-64-bit-oracle-client-library-running-c

instantclient = r"C:\Users\Luisa\Documents\client_BD\instantclient_21_6"

import cx_Oracle
from util.janelas import *
from util.controleSGBD import *

print("Iniciando conexao com servidor")
# colocando o cliente do oracle
# Colocar o path do instant client aqui
cx_Oracle.init_oracle_client(lib_dir=instantclient)

# entrando no sql
enter_host = cx_Oracle.makedsn(
    host="orclgrad1.icmc.usp.br",
    port="1521",
    service_name="pdb_elaine.icmc.usp.br",
)

enter_user = cx_Oracle.connect(
    "a11218692", "a11218692", enter_host, threaded=True
)

cursor = enter_user.cursor()

# usando o sql
# TESTE
# cursor.execute('insert into USUARIO (EMAIL, NOME) values (\'teste@gmail.com\',\'Teste Da Silva\')')
token = login(cursor)
if token:
    main_window(cursor, token)

# commit
enter_user.commit()

# saindo do sql
cursor.close()
enter_user.close()
