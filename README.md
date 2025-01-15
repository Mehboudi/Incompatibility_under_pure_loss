# Incompatibility_under_pure_loss
## Update 15th of Jan. 2025
The newly added d2Run_m.m confirm that for 3<=n<=14 the set of displaced on-off photodetection measurements with r=0.015 remain incompatible under tau=1/(n-1), even within the qubit subspace (i.e., projecting into |0> and  |1> subspace). 

## Original instructions
These codes are attached to our new draft entitled "Measurement incompatibility never breaks under pure loss". The paper is available here: https://doi.org/10.48550/arXiv.2411.05920
It will reproduce the results of Table 1. 

We consider a set of n+1 measurements, based on displaced on-off photo-detection. We truncate to the d=2/3 dimensional subspace. And then we prove that the set are incompatible for the values of r described in the table. 
Thes values of r are not unique, we have found them by searching for the value of r that minimise \tau_{\min} in the Table 1.

## Language and Requirements

Note: These codes are written in MATLAB.

Note: These codes need the codes by Daniel Cavalcanti and Paul Skrzypczyk 
https://github.com/paulskrzypczyk/steeringreview
which is attached to their paper
*[Quantum steering: a review with focus on semi-definite programming](https://doi.org/10.1088/1361-6633/80/2/024001)*      
Rep. Prog. Phys. **80** 024001 (2017).

in turn, you also need CVX and QETLAB.

[CVX](http://cvxr.com/) - a Matlab-based convex modeling framework

[QETLAB](http://www.qetlab.com/) - A MATLAB Toolbox for Quantum Entanglement

## How to run
Open Run_m.m

set "proj=2" (which projects into the 3-d Hilbert soace)

set "n" to your desired value

set "radius" to your desired value (you can use Table 1 in the paper)

set "tau" to your desired value, or according to the Table 1. 

run the code. It tells you if the set is compatible or not.
