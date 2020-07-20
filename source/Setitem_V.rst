Setitem function
================

Genericity polymorphism 'setitem' function

=============== ========== =================================================================
**Parameters**   **Type**   **Description**
*key*             int       the index of the value to set (must be < of the vecttor length)
*value*           double    The value to set
=============== ========== =================================================================

Examples
--------
>>> v=Vector(0,0,0,1,2,2)
>>> v[2]=3
>>> print(v)
 ( 1.0 , 2.0 , 3.0 )
printed