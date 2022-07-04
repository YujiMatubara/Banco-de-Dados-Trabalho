import re

def email(value: str) -> bool:
    res = (
        len(value) <= 255
        and len(value) >= 3
        and re.match(r"^[A-Za-z0-9.+-]+@[A-Za-z0-9.-]+.[a-zA-Z]*$", value)
    )

    if res:
        return True

    print("Email invalido: o email pode ter no maximo 255 caracteres e deve possuir formato valido de email.\n")
    return False


def username(value: str) -> bool:
    if len(value) <= 100:
        return True

    print("Username invalido: o username pode ter no maximo 100 caracteres\n")
    return False

def curso_titulo(value: str) -> bool:
    if len(value) <= 100:
        return True

    print("Nome de curso invalido: o nome do curso pode ter no maximo 100 caracteres\n")
    return False
