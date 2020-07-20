Le function
===========

Genericity polymorphism 'le' function

=============== =========== ==========================
**Parameters**   **Type**   **Description**
*vec*            Vector     The second vector to test
=============== =========== ==========================

Returns
-------
    bint
        The Less or Equal test between the self vector object and the second vector as parameter

Examples
--------
>>> v=Vector(0,0,0,2,2,2)
>>> w=Vector(0,0,0,5,5,5)
>>> print(v<=w)
True