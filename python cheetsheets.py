#from https://github.com/madiedinro/rodin_helpers_py/blob/master/rodin_helpers/__init__.py
#Отображение структурированных данных с указанием типов
def walk(item, level=0, path=[]):
    path_str = " > ".join(map(str, path))
    if isinstance(item, dict):
        print(f"[dict  {path_str}")
        for key, val in item.items():
            walk(val, level+1, [*path, key])
    elif isinstance(item, list):
        print(f"[list  {path_str}")
        for i, val in enumerate(item):
            walk(val, level+1, [*path, i])
    else:
        print(f'|      {path_str}={str(item)}')

#########################################################

