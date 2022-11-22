"""
Python script to demonstrate python sbatch scripts
"""
import datetime

def mylog(mesg):
  now = datetime.datetime.now()
  print(f'[{now}]: {mesg}')

if __name__ == '__main__':
  mylog('Hello, World!')
