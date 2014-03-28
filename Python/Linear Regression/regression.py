# -*- coding: utf-8 -*-
"""
Created on Fri Mar 28 22:14:47 2014

@author: akshay
"""

"""
Linear regression
"""

import numpy as np

def data(filename):
    datas = np.loadtxt(str(filename))
    X = zeros([len(y), 1])
    X[:, 1] = datas[:, 0]
    y = datas[:, 1]
    theta = zeros([len(y),2])
    theta[:,0] = ones(len(y))
    return X, y , theta    
    
def cost_function(X, y, theta):
    terms = len(y)
    cost = 0
    for i in range(terms):
        cost += (y[i] - X.T[i].dot(theta[i]))**2
    cost = cost /(2 * terms)
    return cost

def gradient_descent(X, y, theta, alpha, iters):
    for i in range(iters):
        for j in range(len(y)):
                        