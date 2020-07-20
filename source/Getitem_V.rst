Getitem function
================

Genericity polymorphism 'getitem' function

=============== ========== =================================================================
**Parameters**   **Type**   **Description**
*key*             int       the index of the value to get (must be < of the vecttor length)
=============== ========== =================================================================

Returns
-------
    double
        The indexed value

Examples
--------
>>> v=Vector(0,0,0,1,2,3)
>>> print(v[0])
1.0
>>> print(v[1])
2.0
>>> print(v[2])
3.0