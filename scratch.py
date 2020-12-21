from os import listdir
from os.path import isfile, join

mypath = 'imgs/'
files = [f for f in listdir(mypath) if isfile(join(mypath, f))]
files.sort()

query_str = 'INSERT INTO images(name, location_id) VALUES\n'
for file in files:
    query_str += "('{name}', 1),\n".format(name=file)


print(query_str)