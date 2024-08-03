import polars as pl
import psycopg2
import os.path
import csv
from io import StringIO
import random

conn = psycopg2.connect(host='localhost',database='mephysio',user='postgres',password='slyb5391')
cur = conn.cursor()




tables = pl.read_csv('tables.csv')
for t in tables.rows():
    if not t[0] or not os.path.isfile(t[0]+'.csv'):
        continue
    cols = [x.lower() for x in t[1].split(':')]
    print(cols)
    df = pl.read_csv(t[0]+'.csv')
    print(df)
    # print(df.columns)
    # cols = ["firstname","lastname"]
    df=df.with_columns(pl.all().name.to_lowercase())
    df=df.filter(pl.col('id').is_null()==False).with_columns(pl.when(pl.col('id')>2**31).then(pl.col('id')/2**31).otherwise(pl.col('id')).alias('id'))
    # quit()
    cmd = f"insert into {t[0]} ("
    for r in df.select(cols).rows(named=False):
        r1 = [x if type(x) != type('') else "'"+x.replace("'","''")+"'" for x in r]
        r1 = [str(x) if x != None else "NULL" for x in r1]
        print(r1)
        cmd = f'insert into {t[0]} values ('+','.join(r1)+')'
        print(cmd)
        cur.execute(cmd)
    conn.commit()

# import csv
# with open('patientscsv.csv', newline='') as csvfile:
#     db = csv.reader(csvfile)
#     for row in db:
#         print(row[0])
#     print(db[0][0])