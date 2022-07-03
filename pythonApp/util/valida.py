def email(value: str) -> bool:
    return len(value) <= 255


def username(value: str) -> bool:
    return len(value) <= 100
