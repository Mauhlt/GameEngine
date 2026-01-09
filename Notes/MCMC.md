# Host of Algorithms
- Metropolis Algorithm
- Metropolis-Hastings, Gibbs sampling, Hamiltonian Monte Carlo
- hinges on:
    - proposal distribution being tuned
    - acceptance criteroin reflects posterior ratio
    - effective sample size = accounts for autocorrelation
# Simulation Study Workflow:
1. approx a process with rng 
2. gen data + calculate value of interests (mean, bias, coverage)
3. repeat steps 1-2 many times
# Beginner
-  Law of large numbers
    - relates sample mean and population mean 
    - as you take more samples, the sample mean tends towards the population mean as number of samples tends towards infinity
    - asymptotic theorem (infinities are needed)
    - assumes mean is finite (not infinite nor undefined)
- Cauchy Distribution 
    - no population mean = no law of large numbers
    - never centers at 0
    - extreme values are common enough to not settle
# Intermediate 
- Hierarchical Models
    - MEM Model
    - Normal-Normal Model
    - Calibrated Hierachy
    - BLAST
    - Ex-Nex Model
    - Robot
- methodological comparison
    - compare how different stats models perform in different data contexts
- models = come with assumptions
    - when assumptions are met, good type 1 error control (alpha) + power (1 - Beta)
    - limit to MC methods, need large # of data for many parametrs + large models = curse of dimensionality
    - M * C * # of simulations
        - M = # of models
        - C = number of data configs
        - results in huge number
# Advanced
- at bleeding edge of research
- simulation study = training wheels for new models
- good model = model parameters are estimated correctly or type-1 error control or robustness to assumption violation
