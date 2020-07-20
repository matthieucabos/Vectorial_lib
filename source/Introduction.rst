Introduction
============

Here is my new version of the Vectorial library.
To setup manually :

	* Install all prerequires as following :
		* Get python3.8 from *www.python.org*
		* **pip install sphinx**
		* **pip install numpy**
		* **pip install cython**
		* **pip install sphinxcontrib-napoleon**
		* **pip install sphinx-autoapi**
	* Compile the algebra_3D.pyx file using the command :
		**python setup_cython_3d.py build_ext --inplace**
	* compile the associated html file using the command:
		**.\make html**