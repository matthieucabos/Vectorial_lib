Eq function
===========

Genericity polymorphism 'eq' function

=============== =========== ==========================
**Parameters**   **Type**   **Description**
*vec*            Vector     The second vector to test
=============== =========== ==========================

Returns
-------
    bint
        The equality test between the self vector object and the second vector as parameter

Examples
--------
>>> v=Vector(0,0,0,2,2,2)
>>> w=Vector(0,0,0,2,2,2)
>>> print(v==w)
True