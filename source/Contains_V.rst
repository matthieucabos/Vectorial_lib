Contains function
=================

Genericity polymorphism 'contains' function

============== =========== ========================
**Parameters**   **Type**   **Description**
*vec*            Vector     The vector to compare
============== =========== ========================

Returns
-------
    bint
        Test the colinearity of the self vector and the second operand :
            * True  => self  = alpha x vec
            * False => self != alpha x vec
            
Examples
--------
>>> v=Vector(0,0,0,1,1,1)
>>> w=Vector(0,0,0,2,2,2)
>>> z=Vector(1,1,1,2,3,4)
>>> print(v in w)
True
>>> print(v in z)
False