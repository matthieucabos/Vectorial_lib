import os
os.system('.\\install_prerequires.sh')
os.system('.\\install_prerequires.bat')

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules=[
		Extension("algebra_3D",
				sources=["algebra_3D.pyx"],
				extra_compile_args=['-fopenmp'],
				extra_link_args=['-fopenmp'])]
setup(
	name="algebra_3D",
	cmdclass = {'build_ext' : build_ext},
	ext_modules=ext_modules
	
	)
