# eksa.matrix.lab
I am deploying EKS Anywhere in my HomeLab.

A significant portion of this repo is not applicable in most situations.  I am essentially plumbing up a new interface on my Firewall, creating a new /22 off that interface, and starting from scratch.

Goal:  to create my own EKS Anywhere environment from bare metal (Intel NUCs) and install media (Ubuntu Server 22.04).  I want this environment to be completely independent of everything else in my lab. 

## Build EKS-ADMIN Host

Install/Configure: 

* BIND  
* PXE (TFTP/DHCP)  
* WWW 

## References
https://anywhere.eks.amazonaws.com/  
https://anywhere.eks.amazonaws.com/docs/  

