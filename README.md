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
Develop a **Genetic Algorithm (GA)** to approximate a low-complexity analytical expression for a two-variable function **f(u1, u2)**, where the exact formula is unknown but the function is continuous. The goal is to represent f using a linear combination of Gaussian functions, aiming for minimal deviation between the true and approximated values.

The target approximation formula is:
\[
\hat{f} = A_1 G_1 + A_2 G_2 + \dots + A_{15} G_{15} + \beta
\]
where each \(G_i\) is a Gaussian of the form:
\[
G(u_1, u_2) = e^{-((u_1 - c_1)^2 / (2 \sigma_1^2) + (u_2 - c_2)^2 / (2 \sigma_2^2))}
\]

### 🧬 Methodology
- **Encoding Chromosomes:** Each chromosome represents parameters for Gaussian functions: amplitudes (A), centers (c1, c2), and standard deviations (σ1, σ2). Real numbers are used instead of bit strings.
- **Parameter Ranges:**
  - Amplitudes: A ∈ (fmin, fmax)
  - Centers: c1, c2 ∈ (a−3, b+3) based on the function domain
  - Standard Deviations: σ1, σ2 ∈ (0.2, 1.3)

- **Initial Population:**
  - 150 chromosomes per generation.
  - 30% of the best solutions advance directly to the next generation.
  - 10% of new chromosomes are random.
  - 60% are generated through crossover.

- **Fitness Function:**
  - Initially used **Absolute Error** but transitioned to **Mean Squared Error (MSE)** for better convergence:
    \[
    e_{\text{mse}} = \frac{1}{n} \sum (f(x_i) - \hat{f}(x_i))^2
    \]

- **Crossover Techniques:**
  - Single-point and two-point crossover were tested.
  - Final method: **Averaging Genes** (child genes = mean of parent genes) for better stability.

- **Mutation:**
  - Randomly alters a gene within its allowed range.
  - Mutation probability: 30–40%, tuned for best performance.

### 🛠️ Implementation
- Function **functionLimits.m** computes fmin/fmax to set amplitude ranges.
- Helper functions:
  - **f.m / fBar.m**: Original function and its Gaussian approximation.
  - **crossover.m, mutation.m, randomSelection.m**: GA operators.
  - **plots.m**: For visualization and convergence tracking.

The **target function** used for testing was:
\[
f(u_1, u_2) = \sin(u_1 + u_2) \cdot \sin(u_2^2)
\]
with \(u_1 \in [-1, 2]\) and \(u_2 \in [-2, 1]\).

### 📊 Results
- Optimal performance with **15 Gaussian functions**, balancing model complexity and fit accuracy.
- Convergence:
  - Algorithm set to stop if MSE < 0.01 or after a max number of generations.
- **Execution Time:**
  | Max Generations | Total Time (s) |
  |-----------------|----------------|
  | 100            | 24             |
  | 500            | 103            |
  | 1000           | 220            |
  | 2000           | 487            |
  | 10000          | 2300           |

- **Performance Observations:**
  - Achieved a good approximation with visible alignment between original and approximated function plots.
  - Some oscillation in fitness (MSE) was observed across generations.
  - Occasionally, parameters (e.g., σ2) converged to identical values across Gaussians, hinting at optimization challenges.

### 📄 Files
- `Project.pdf`: Detailed project report.
- `MATLAB Files/`:
    - `crossover.m`: Crossover operator.
    - `fLimits.m`: Function limit computation.
    - `f_Function.m`: Function definition.
    - `fitnessFunction.m`: Fitness evaluation (MSE-based).
    - `gaussian.m`: Gaussian function.
    - `geneticAlgorithm.m`: Full GA script.
    - `main.m`: Driver script to execute GA.
    - `mutation.m`: Mutation function.
    - `plots.m`: Plotting utilities.
    - `randomSelection.m`: Random selection operator.

### 🖼️ Visual Results
- 3D plot of original function vs. approximation.
- Convergence plots showing error vs. generation.
- Visual assessment confirmed that the GA provides a **reasonably accurate low-complexity analytical approximation** despite some variability across runs.

### 🔍 Observations & Limitations
- The GA achieved a **good fit** but exhibited occasional inconsistencies in convergence, likely due to the stochastic nature of evolutionary algorithms.
- Mutation played a crucial role in maintaining diversity and avoiding local optima.
- Some parameter duplications (e.g., identical σ2 across Gaussians) indicate potential areas for further refinement.




## 📂 Repository Contents
- **📄 Assignment Reports**:
  - [Assignment 1 Report](./Project_1.pdf)
  - [Assignment 2 Report](./Project_2.pdf)
  - [Assignment 3 Report](./Project_3.pdf)
- **💻 Code**: MATLAB scripts for the implementation and analysis of optimization methods.

---
