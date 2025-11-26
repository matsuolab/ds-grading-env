import pandas as pd
import numpy as np
import os
import sys

SUBMISSION_PATH = os.environ["USERSUBMISSION"]
sys.path.append(os.path.dirname(os.environ['USERSUBMISSION']))
from submission import homework

def score():
	arg = 1
	return homework(arg)

if __name__ == "__main__":
	print(score())
