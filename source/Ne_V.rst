Ne function
===========

Genericity polymorphism 'ne' function

=============== =========== ==========================
**Parameters**   **Type**   **Description**
*vec*            Vector     The second vector to test
=============== =========== ==========================

Returns
-------
    bint
        The non-equality test between the self vector object and the second vector as parameter

Examples
--------
>>> v=Vector(0,0,0,2,2,2)
>>> z=Vector(0,0,0,1,2,3)
>>> print(v==z)
False