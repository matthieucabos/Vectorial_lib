# Vectorial_lib
A Python vectorial library

# Algebra_3D module

**Author** : *CABOS Matthieu*

**Date** : *30/09/2020*

**Organization** : **INRA-CNRS**

Introduction
------------

Here is my new version of the Vectorial library.

This library is an optimized vectorial computation api.
Made with Cython, it works as fastest as a standard C++ or C librairy.

This module have been splitted into 2 main parts :

	* **The Point Object** : It allows to manipulate Point Object into a 3 Dimension environnement. The main operators have been implemented.This object are compatible with the following Vector Class. The avaible methods are listed as follow :
 
		* **copy** : Clone the current object
		* **op** : Operator facrtorization code implementing all standard operator (+,-, ...)
		* **print_screen** : Standard terminal scrren printer
		* **Getters and Setters**
  
	* **The Vector Object** : It permit to manipulate Vector Objects into a 3 dimensions environnement.	
 This class use Point as parameters, many of these methods are the "well known" vector standard manipulation operators. 
 The avaible methods are listed as follow :
 
		* **angle** Get the alpha angle between vector and norm.
		* **angle_vec** Get the alpha angle between two vectors
		* **copy** Get a clone of the current object
		* **cos** Get a cosinus from two vector's angle
		* **dot** Compute standard dot between two vectors
		* **hortogo** Assert hortogonality of two vectors
		* **length** Get the vector's **real** length
		* **op** Operator facrtorization code implementing all standard operator (+,-,*, ...)
		* **pointAt** Compute the translation from given Point and Vector
		* **print_screen** Standard terminal scrren printer
		* **prod** Compute standard cross product between two vectors
		* **setLength** Set the vector's **real** length
		* **setPoints** Set Vector's main points
		* **translate** Translate self vector to the given Point.
		* **unitVector** Get unit vector from self.
		* **vect** Get the absolute vector from origin


A full description of each Class is avaible on the left tree entries.

Here you will find the main Scheme to have a global look on this module.

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
 
 **python setup.py build_ext --inplace**
 
 Once compiled, load the module in python since the current directory with :
 
 **from algebra_3D import \***
 
 Documentation
 -------------
 
 The help documentation may be found using index.html or with the associated download link.
 
 You have to generate it using the command:
 
 **.\make html**     (Windows users)

or

**make html**         (UNIX users)

or download it at : https://drive.google.com/file/d/14g0wJf5rDBpqmloDHmZMtnQgtbxQHei6/view?usp=sharing

I've been working on an high-performance vectorial code to rule standard algebra computation
on the Anubis calculator from Lenovo.

The library is fully operationnal on CentOS Unix-based system, tested and approved for Windows, Linux, and MacOS

Support
-------

Please to send failure reports

support at : matthieu.cabos@tse-fr.eu
