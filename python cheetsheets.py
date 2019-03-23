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
#код для дебагинга реквеста, спасибо https://github.com/madiedinro
import logging

try:
    from http.client import HTTPConnection
except ImportError:
    from httplib import HTTPConnection
HTTPConnection.debuglevel = 1

logging.basicConfig()
logging.getLogger().setLevel(logging.DEBUG)
requests_log = logging.getLogger("urllib3")
requests_log.setLevel(logging.DEBUG)
requests_log.propagate = True

#######################################

#Pandas
#сразу много табличек в зависимости от того, что записано в графе TariffItem. Для этого в pandas есть метод groupby().

groups = df.groupby('TariffItem')
groups.get_group('Газ').head()


####################################

#Запрос к странице и преобразование html в текст
import requests
import html2text
s=requests.get('https://yandex.ru/search/?lr=213&text=test123')
d=html2text.HTML2Text().handle(s.text)
print(d)
################################################


#итеративный разбор json'a ищем вхождение по параметру
#выводим то, где встречается address
from urllib3.util import parse_url
import json
import requests

params={
    'query-string':'178.57.86.210',
    #'flags':'no-filtering',
    'source':'RIPE'
}

q=requests.get('https://rest.db.ripe.net/search.json',params).json()

def iterate(items):
    if isinstance(items,list):
        for item in items:
            iterate(item)
    elif isinstance(items,dict):
        for key,item in items.items():
            iterate(item)
            if item=='address':
                print(items)
iterate(q)
#############################


#сделать рабочую область ячеек пошире
from IPython.core.display import display, HTML
display(HTML("<style>.container { width:90% !important; }</style>"))

##################################


#меняем дефолтные настройки пандаса
pd.set_option('max_colwidth', 800)
pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
#############################################


#читаем файл в словарь, в файле каждая строка json
import json

users=dict()
with open('100users.log') as f:
    for line in f:
        data=json.loads(line)
        break