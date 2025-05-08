# 🔍 Optimization Methods
Assignments for the "Optimization Techniques" Course Faculty of Engineering, AUTh School of Electrical and Computer Engineering: Optimization algorithms for unconstrained/ constrained problems, Development of a genetic algorithm for low-complexity function approximation  

---

### Assignments and Project for "Optimization Techniques" Coursework (2023)
Assignment for the "Computer Graphics" Course  
Faculty of Engineering, AUTh  
School of Electrical and Computer Engineering  
Electronics and Computers Department

📚 *Course:* Computer Graphics                   
🏛️ *Faculty:* AUTh - School of Electrical and Computer Engineering  
📅 *Semester:* 7th Semester, 2022–2023


---

## 📖 Overview
This repository contains three assignments completed as part of the Optimization Methods course at Aristotle University of Thessaloniki. Each assignment focuses on different optimization techniques and their application to specific problems. The assignments were implemented using MATLAB, and the results showcase the effectiveness and limitations of various optimization algorithms.

## 📚 Table of Contents
- [Overview](#-overview)
- [First Assignment: Unconstrained Optimization Methods](#-first-assignment-unconstrained-optimization-methods)
- [Second Assignment: Constrained Optimization with Gradient-Based Methods](#-second-assignment-constrained-optimization-with-gradient-based-methods)
- [Third Assignment: Constrained Optimization with Projection Methods](#-third-assignment-constrained-optimization-with-projection-methods)
- [Project: Genetic Algorithm for Function Approximation](#-project-genetic-algorithm-for-function-approximation)
- [Repository Structure](#-repository-structure)

---

## 🧩 Assignment 1: Unconstrained Optimization Methods
### 🎯 Goals
- Compare and analyze the performance of the following methods:
  - **🔎 Dichotomous Search**
  - **📐 Golden Section Search**
  - **🔢 Fibonacci Search**
  - **📉 Derivative-Based Dichotomous Search**
- Evaluate their convergence behavior for different functions and parameter settings.

### ✨ Features
- Application of the methods to three distinct functions.
- Analysis of the impact of varying step sizes (`l`) and tolerances (`ε`) on convergence.
- Visualizations of convergence patterns and computational efficiency.

### 🏆 Results
- The methods provided consistent results across different functions, with faster convergence observed for larger step sizes (`l`).
- The Golden Section and Fibonacci methods showed similar performance, with slight variations in computational steps.
- Derivative-based methods highlighted the role of function properties in algorithmic efficiency.

---

## 🧩 Assignment 2: Constrained Optimization with Gradient-Based Methods

### 🎯 Goals
- Optimize the objective function: 

  	**f(x, y) = x^5 * exp(-x² - y²)**

- Compare the performance of:
  - **📉 Steepest Descent**
  - **📊 Newton's Method**
  - **⚙️ Levenberg–Marquardt Algorithm**

### ✨ Features
- Analysis of convergence from different initial points.
- Evaluation of step-size selection strategies:
  - Fixed step size
  - Line search minimizing `f(xk + γk * dk)`
  - Armijo rule-based step size.
- Application to both constrained and unconstrained scenarios.

### 🏆 Results
- **Steepest Descent**: Effective for some initial points but sensitive to local optima.
- **Newton's Method**: Limited by the requirement of a positive definite Hessian matrix.
- **Levenberg–Marquardt Algorithm**: Improved robustness, converging to global optima in challenging scenarios.

---

## 🧩 Assignment 3: Optimization with Equality and Inequality Constraints

### 🎯 Goals
- Minimize the objective function: 

  	**f(x1, x2) = (1/3)x1² + 3x2²**

  Subject to constraints: 
  - **-10 ≤ x1 ≤ 5**
  - **-8 ≤ x2 ≤ 12**

- Explore the behavior of the Steepest Descent algorithm under varying constraints and parameter settings.

### ✨ Features
- Simulation of unconstrained and constrained optimization scenarios.
- Analysis of parameter sensitivity (e.g., `sk`, `γk`, and initial points).
- Implementation of custom adjustments to ensure feasibility within constraints.

### 🏆 Results
- Parameter tuning is crucial for convergence under constraints.
- Inappropriate step size (`sk`) led to divergence or suboptimal solutions.
- Adjustments to ensure feasibility improved the algorithm’s reliability.

---

---

## 🧩 Project: Genetic Algorithm for Function Approximation

### 🎯 Goals
Development of a **Genetic Algorithm (GA)** to approximate a low-complexity function efficiently.

### ✨ Features
- Implementation of core GA operators:
    - Crossover
    - Mutation
    - Selection
- Custom fitness function evaluation.
- Visualization of convergence behavior and results.


## 📂 Repository Contents
- **📄 Assignment Reports**:
  - [Assignment 1 Report](./Project_1.pdf)
  - [Assignment 2 Report](./Project_2.pdf)
  - [Assignment 3 Report](./Project_3.pdf)
- **💻 Code**: MATLAB scripts for the implementation and analysis of optimization methods.

---
