import numpy as np 
import matplotlib.pyplot as plt 
from icecream import ic
from scipy.stats import norm

# surface roughness measurements
x_apples = np.array([2.56, 3.01, 3.22, 3.44, 3.62, 3.03, 2.40, 
                     2.70, 2.58, 3.94, 2.76, 3.30, 2.92, 3.36, 
                     2.69, 2.44, 2.43, 3.20, 2.93, 2.92])

x_lemons = np.array([4.57, 4.12, 4.08, 4.64, 3.68, 4.28, 4.33, 
                     3.90, 4.09, 3.53, 3.54, 4.04, 4.29, 5.03, 
                     3.73, 4.07, 3.97, 3.23, 3.82, 3.28])

apples_mean = np.mean(x_apples)
lemons_mean = np.mean(x_lemons)

apples_std = np.std(x_apples)
lemons_std = np.std(x_lemons)

pdf_apples = lambda x : norm.pdf(x, apples_mean, apples_std)
pdf_lemons = lambda x : norm.pdf(x, lemons_mean, lemons_std)

obs_x = 3.4

print(f"Likelihood of being an apple: {pdf_apples(obs_x)}\n")
print(f"Likelihood of being a lemon: {pdf_lemons(obs_x)}\n")

def max_likelihood_classifier(x):
  if(pdf_apples(x) > pdf_lemons(x)):
    print("\nMost likely an apple\n")
  elif(pdf_apples(x) == pdf_lemons(x)):
    print("\nEqually likely to be apple or lemon\n")
  else:
    print("\nMost likely a lemon\n")

max_likelihood_classifier(obs_x)
