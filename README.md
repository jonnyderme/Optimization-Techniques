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

## 🧩 First Assignment: Unconstrained Optimization Methods

### 🎯 Goals
Implement and analyze four key **optimization methods** for one-dimensional functions:
- **🔎 Dichotomous Search**
- **📐 Golden Section Method**
- **🔢 Fibonacci Method**
- **📈 Dichotomous Search with Derivative**

Each method is applied to three test functions over the interval [0, 3].

### 🧬 Methodology

#### 1️⃣ Dichotomous Search
- **Parameters:**
  - `e`: distance from the midpoint (ε)
  - `l`: final search interval width (λ)
- Tested for:
  - Fixed `l = 0.001` with varying `e` (1e-5 to 0.005)
  - Fixed `e = 0.001` with varying `l` (0.005 to 0.1)

- **Insights:**
  - Increasing `e` leads to **more function calls** because the narrowed interval shrinks slower.
  - Larger `l` reduces function calls as fewer iterations are needed to reach the desired interval.

#### 2️⃣ Golden Section Method
- **Parameters:**
  - Only `l` (final interval width)
- Tested with `l` ranging from 0.001 to 0.1.
- Analyzed function call count and convergence across all three test functions.

#### 3️⃣ Fibonacci Method
- Similar to the Golden Section but based on Fibonacci numbers.
- Tested with `l` from 0.005 to 0.1.
- Explored function call efficiency vs. interval width.

#### 4️⃣ Dichotomous Search with Derivative
- Combines the dichotomous approach with derivative information.
- Tested over the same range as above (`l` from 0.005 to 0.1).

### 📊 Comparative Results
- All methods were compared for:
  - Number of function evaluations per method and per function.
  - Performance trends: derivative-based dichotomous search had the **fewest function calls**, followed by Golden Section, Fibonacci, and lastly standard Dichotomous Search.

| Method                              | Function Calls (Trend)                 |
|-------------------------------------|----------------------------------------|
| Dichotomous with Derivative         | ✅ Least calls                          |
| Golden Section                      | Good performance                       |
| Fibonacci Method                    | Similar to Golden Section              |
| Standard Dichotomous Search         | ❗ Most calls                           |

- Observations confirm theoretical expectations:  
  - **Golden Section ≈ Fibonacci Method** in efficiency.
  - **Derivative-based method** significantly outperforms others in required function calls.

### 🖼️ Visuals & Plots
- Function plots for each test function (`f1`, `f2`, `f3`)
- Convergence plots:
  - Function calls vs. `e` (for Dichotomous)
  - Function calls vs. `l` (for all methods)
  - Interval edges `[a_k, b_k]` vs. iteration index `k`

- Comparative plots:
  - All methods on the same chart to visualize relative performance.

### 📄 Files
- `Report_10015.pdf`: Full assignment report.
- MATLAB scripts:
    - `BisectionMethod.m`, `goldenRatioMethod.m`, `fibonacciMethod.m`, `derivativeMethod.m`
    - `Task1.m`, `Task2.m`, `Task3.m`, `Task4.m`: Main task scripts
    - `functionSelector.m`, `derivativeSelector.m`: Utility scripts

### 🔍 Conclusions
- Function call patterns match expectations:
  - **Higher precision (smaller `l` or `e`) = more iterations**
  - **Derivative-based optimization = most efficient**
- The results provide a **clear experimental validation** of optimization method theories, especially regarding convergence speed and computational cost.

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

The target approximation formula is: f_hat = A1 * G1 + A2 * G2 + ... + A15 * G15 + beta
where each G_i is a Gaussian of the form: G(u1, u2) = exp(-(((u1 - c1)^2) / (2 * sigma1^2) + ((u2 - c2)^2) / (2 * sigma2^2)))

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
  - Initially used **Absolute Error** but transitioned to **Mean Squared Error (MSE)** for better convergence: e_mse = (1/n) * Σ (f(x_i) - f_hat(x_i))^2


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

The **target function** used for testing was: f(u1, u2) = sin(u1 + u2) * sin(u2^2)

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
