# Vectorial_lib
A Python vectorial library

# Algebra_3D module

Author : CABOS Matthieu

Date : 20/07/2020

Organization : INRA-CNRS

Prerequires
-----------
Install Python 3.8 from https://www.python.org/

Install associated libraries :
 * *numpy*
 * *random*
 * *cython*
 * *sphinx*
 * *numpydoc*
 * *sphinx-autoapi*
 * *sphinx-automodapi*
 * *sphinx-rtd-theme*
 
 The librairies prerequired could be installed from the install_prerequires.sh and install_prerequires.bat 
 (depending of system : .sh is the linux style script and .bat is the windows style script)
 
 Installation
 ------------
 
 This repository contain my last work :
 The algbra_3D.pyx is the optimised version of the algebra_3D.py library containing all standards
 vectorial operations and usefull utils.
 
 To compile it write in the command prompt :
 
 **python setup_cython_3D.py build_ext --inplace**
 
 Once compiled, load the module in python since the current directory with :
 
 **from algebra_3D import \***
 
 Documentation
 -------------
 
 The help documentation may be found using index.html or with the associated download link.
 
 You have to generate it using the command:
 
 **.\make html**     (Windows users)

or

**make html**         (UNIX users)

or download it at : 

I've been working on an high-performance vectorial code to rule standard algebra computation
on the Anubis calculator from Lenovo.

The library is fully operationnal on CentOS Unix-based system, tested and approved for Windows, Linux, and MacOS

Support
-------

Please to send failure reports

support at : matthieu.cabos@tse-fr.eu
