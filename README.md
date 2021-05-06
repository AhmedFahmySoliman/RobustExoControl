## Robust Locomotion Control of a Self-Balancing and Underactuated Bipedal Exoskeleton: Task Prioritization and Feedback Control
### Ahmed Fahmy Soliman and Barkan Ugurlu
---
### General info

In this research, we aim for robust locomotion control of an underactuated bipedal exoskeleton with arbitrary human users; see Fig. 1. To ensure robust and dynamic walking behavior despite parameter uncertainties and external disturbances, we synthesized three distinct controllers, namely, Centroidal Momentum Control (CMC), Basic Admittance Controller (BAC), and ZMP Impedance Feedback (ZIF). In order to understand the best performing controller, we ran several simulations with 12 distinct anthropomorphic subjects concerning two walking scenarios, 1) perturbation free dynamic walking, 2) perturbed dynamic walking. The results are statistically analyzed.

This repository contains the recursive algorithm that we used to compute Jacobian, Inertia, Coriolis centrifugal, and Gravitational matrices in RecursiveAlgorithms folder. In addition to the necessary codes to regenerate figures, ANOVA tables, and Post-Hoc tables which are used to perform statistical analysis The data used to regenerate the results is obtained from a series of simulation experiments conducted via MSC.ADAMS and Simulink in StatisticalAnalysis folder. An explanatory document is added to explain the recursive algorithms theoreticalley in the documents folder. The codes are written in MATLAB mfile syntax.

![Fig1](https://user-images.githubusercontent.com/82141384/116953596-579e5c00-ac96-11eb-9c7c-ed30a01e2024.png)
<p> Fig. 1: Left: Self-balancing Lower body exoskeleton Co-Ex. Right: Its MSC.ADAMS simulation model.<p>


### Figure 1
The figure illustrates the results for a perturbation free walking motion with forward velocity of 0.3m/s. The plot shows mean±SD variation regions for 8 consecutive steps. Pink, green, and blue regions indicate the corresponding variations for ZIF, BAC, and CMC responses, respectively. Mean variations were denoted via solid lines accordingly. In this Figure, we plotted the ZMP variation
(_x<sub>zmp</sub>_, _y<sub>zmp</sub>_) and pitch axis angular velocity _ω_<sub>pitch</sub> for the three controllers in question. 

### Figure 2
The figure illustrates the results for perturbed dynamic walking motion with forward velocity of 0.2 m/s. The disturbances are shown by the grey-shaded areas. External impulsive force of 200 N was applied at the hip of the system, first along the _x_ direction when t = 10.6 s, then along the y direction when t = 12.4 s. The plot shows mean±SD variation regions for 8 consecutive steps. Pink, green, and blue regions indicating the corresponding variations for ZIF, BAC, and CMC responses, respectively. Mean variations were denoted via solid lines accordingly. In this Figure, we plotted the ZMP variation 
(_x<sub>zmp</sub>_, _y<sub>zmp</sub>_) and pitch axis angular velocity _ω<sub>pitch</sub>_ for the three controllers in question.

### Figure 3
The variation between the three controllers is depicted in this figure based on the peak-to-peak average of ZMP in x and y directions and pitch axis angular velocity which are represented by (_x<sub>zmp</sub><sup>pp</sup>_ , _y<sub>zmp</sub><sup>pp</sup>_ , _ω<sub>pitch</sub><sup>pp</sup>_) respectively. The average of  (_x<sub>zmp</sub><sup>pp</sup>_ , _y<sub>zmp</sub><sup>pp</sup>_ , _ω<sub>pitch</sub><sup>pp</sup>_) for the 12 subjects is obtained and plotted for the two walking scenarios.  

### ANOVA Tables
* __ANOVA Table1__ used to generate Factorial Repeated Measures ANOVA table to compare between the three controllers for perturbation free dynamic walking based  on (_x<sub>zmp</sub><sup>pp</sup>_ , _y<sub>zmp</sub><sup>pp</sup>_ , _ω<sub>pitch</sub><sup>pp</sup>_) for each subject. The significant level is chosen to be 0.05.
* __ANOVA Table2__ used to generate Factorial Repeated Measures ANOVA table to compare between the three controllers for perturbed dynamic walking based on (_x<sub>zmp</sub><sup>pp</sup>_ , _y<sub>zmp</sub><sup>pp</sup>_ , _ω<sub>pitch</sub><sup>pp</sup>_) for each subject. The significant level is chosen to be 0.05.

### Post-Hoc Tables
* __Post-Hoc Table1__ used for pairwise comparison  between the three controllers for perturbation free dynamic walking based on (_x<sub>zmp</sub><sup>pp</sup>_ , _y<sub>zmp</sub><sup>pp</sup>_ , _ω<sub>pitch</sub><sup>pp</sup>_) for each subject. Bonferroni method is used with adjusted significant level of 0.0167 per test (0.05/3).
* __Post-Hoc Table2__   used for pairwise comparison  between the three controllers for perturbed dynamic walking based on (_x<sub>zmp</sub><sup>pp</sup>_ , _y<sub>zmp</sub><sup>pp</sup>_ , _ω<sub>pitch</sub><sup>pp</sup>_) for each subject. Bonferroni method is used with adjusted significant level of 0.0167 per test (0.05/3).

### Authors
Contact us in case of any queries

Ahmed Fahmy Soliman - fahmy.ahmed@ozu.edu.tr

Barkan Ugurlu - barkan.ugurlu@ozyegin.edu.tr



