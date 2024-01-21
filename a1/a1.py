import numpy as np 
from icecream import ic
from scipy.stats import norm

################## Q1 (maximum likelihood classifier)

# surface roughness measurements
x_apples = np.array([2.56, 3.01, 3.22, 3.44, 3.62, 3.03, 2.40, 
                     2.70, 2.58, 3.94, 2.76, 3.30, 2.92, 3.36, 
                     2.69, 2.44, 2.43, 3.20, 2.93, 2.92])

x_lemons = np.array([4.57, 4.12, 4.08, 4.64, 3.68, 4.28, 4.33, 
                     3.90, 4.09, 3.53, 3.54, 4.04, 4.29, 5.03, 
                     3.73, 4.07, 3.97, 3.23, 3.82, 3.28])

# calculate means and std
apples_mean = np.mean(x_apples)
lemons_mean = np.mean(x_lemons)

apples_std = np.std(x_apples)
lemons_std = np.std(x_lemons)

# build pdf for each class
pdf_apples = lambda x : norm.pdf(x, apples_mean, apples_std)
pdf_lemons = lambda x : norm.pdf(x, lemons_mean, lemons_std)

obs_x = 3.4

print("Q1")
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
print("Q1 end\n")

################ Q2 (bayesian classifier)
# Prior Knowledge: 2000 lemons and 1000 apples

n_apples = 1000
n_lemons = 2000

# priors
P_apple = n_apples / (n_apples + n_lemons)
P_lemon = n_lemons / (n_apples + n_lemons)

# don't need marginal probability P(x) because it's the same for both
# classes so it'll just cancel out

def bayesian_classifier(x):
  likelihood_apple = pdf_apples(x)
  likelihood_lemon = pdf_lemons(x)

  P_apple_given_x = likelihood_apple*P_apple
  P_lemon_given_x = likelihood_lemon*P_lemon

  if(P_apple_given_x > P_lemon_given_x):
    print(f"\nMost likely an apple, with P(Apple|x=3.4) = {P_apple_given_x}\n")
  elif(P_apple_given_x == P_lemon_given_x):
    print("\nEqually likely to be apple or lemon")
  else:
    print(f"\nMost likely a lemon, with P(Lemon|x=3.4) = {P_lemon_given_x}\n")

print("Q2")
bayesian_classifier(obs_x)
print("Q2 end\n")

################ Q3 (joint probability classifier)

P_lemon_yellow = 0.75
P_apple_yellow = 0.25
P_lemon_red = 0.08
P_apple_red = 0.92

def joint_probability_classifier(x:float, colour:str):
  likelihood_apple_given_x = pdf_apples(x)
  likelihood_lemon_given_x = pdf_lemons(x)

  if(colour == "yellow"):
    likelihood_apple_given_colour = P_apple_yellow
    likelihood_lemon_given_colour = P_lemon_yellow
  elif(colour == "red"):
    likelihood_apple_given_colour = P_apple_red
    likelihood_lemon_given_colour = P_lemon_red
  else:
    print("\nplease enter either 'yellow' or 'red")
  
  P_apple_given_x_and_colour = P_apple*likelihood_apple_given_x*likelihood_apple_given_colour
  P_lemon_given_x_and_colour = P_lemon*likelihood_lemon_given_x*likelihood_lemon_given_colour

  print("Non-normalized Values:")
  if(P_apple_given_x_and_colour > P_lemon_given_x_and_colour):
    print(f"\nMost likely an apple, P = {P_apple_given_x_and_colour}\n")
  elif(P_apple_given_x_and_colour == P_lemon_given_x_and_colour):
    print("\nEqually likely to be apple or lemon")
  else:
    print(f"\nMost likely a lemon, P = {P_lemon_given_x_and_colour}\n")
  
  print(f"\nProbability of being an apple: {P_apple_given_x_and_colour}")
  print(f"\nProbability of being a lemon: {P_lemon_given_x_and_colour}")

  normalizing_constant = P_apple_given_x_and_colour + P_lemon_given_x_and_colour

  P_joint_apple = P_apple_given_x_and_colour / normalizing_constant
  P_joint_lemon = P_lemon_given_x_and_colour / normalizing_constant

  print("\nNormalized Values:")
  if(P_joint_apple > P_joint_lemon):
    print(f"\nMost likely an apple, P = {P_joint_apple}\n")
  elif(P_joint_apple == P_joint_lemon):
    print("\nEqually likely to be apple or lemon")
  else:
    print(f"\nMost likely a lemon, P = {P_joint_lemon}\n")
  
  print(f"\nProbability of being an apple: {P_joint_apple}")
  print(f"\nProbability of being a lemon: {P_joint_lemon}")

print("Q3")
joint_probability_classifier(obs_x, "yellow")
print("Q3 end\n")
