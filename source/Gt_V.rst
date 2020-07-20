Gt function
===========

Genericity polymorphism 'le' function

=============== =========== ==========================
**Parameters**   **Type**   **Description**
*vec*            Vector     The second vector to test
=============== =========== ==========================

Returns
-------
    bint
        The Greater Than test between the self vector object and the second vector as parameter

Examples
--------
>>> v=Vector(0,0,0,3,3,3)
>>> w=Vector(1,2,1,8,4,8)
>>> print(w>v)
True
>>> print(v>w)
False