# -*- coding: utf-8 -*-
"""
Created on Fri Mar 28 22:14:47 2014

@author: akshay
"""

"""
Linear regression
"""

import numpy as np
import matplotlib as mp

def data(filename):
    datas = np.loadtxt(str(filename))
    X = np.zeros([len(y), 1])
    X[:, 1] = datas[:, 0]
    y = datas[:, 1]
    theta = np.zeros([len(y),2])
    theta[:,0] = np.ones(len(y))
    return X, y , theta    
    
def cost_function(X, y, theta):
    terms = len(y)
    cost = 0
    for i in range(terms):
        cost += (y[i] - X.T[i].dot(theta[i]))**2
    cost = cost /(2 * terms)
    return cost

def gradient_descent(X, y, theta, alpha, iters):
    grad = np.zeros([len(iters), 1])
    for i in range(iters):
        for j in range(len(y)):
            theta[1][j] = theta[1][j] - (alpha/len(y))*(y[j] - X.T[j].dot(theta[j]))*X[1][j]
        grad[i] = cost_function(X, y , theta)
    return grad
                
def predict(X):
        
    
    
    
    