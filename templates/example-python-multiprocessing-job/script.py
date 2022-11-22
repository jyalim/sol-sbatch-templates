"""
Python script to demonstrate python sbatch scripts using the
multiprocessing library
"""
import datetime
import multiprocessing as mp
import pandas as pd

df = pd.read_csv('dat/example.dat',delim_whitespace=True)

def mylog(mesg):
  now = datetime.datetime.now()
  print(f'[{now}]: {mesg}')

def example_kernel(k,row):
  mylog(f'{k} row: {row.__str__()}')

def main(k):
  row = df.iloc[k]
  example_kernel(k,row)
  return f'{k} Complete'

pool    = mp.Pool()
results = pool.map(main,df.index)

mylog('COMPLETE, PRINTING RESULTS')
print(results)
