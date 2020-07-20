import numpy as np

__author__="CABOS Matthieu"
__date__=8_07_2020

cdef class Point():
    cdef double X 
    cdef double Y
    cdef double Z
    """
        The point object to compute 2 dimensions geometric interaction.

        =============== ==========
        **Attributes**   **Type**
        *x*               float
        *y*               float
        =============== ==========
    """

    def __cinit__(self,x,y,z):
        self.X=x
        self.Y=y
        self.Z=z

        # getters and setters
    cpdef set_x(self,double x):
        """
            Setters : Set the value of x

            =============== =========== ====================
            **Parameters**    **Type**    **Description**
            *x*                double      The value to set
            =============== =========== ====================

            Examples
            --------
            >>> p=Point(0,0,1)
            >>> print(p)
             ( 0.0 , 0.0 , 1.0 )
            printed
            >>> p.set_x(2)
            >>> print(p)
             ( 2.0 , 0.0 , 1.0 )
            printed
        """
        self.X=x
    cpdef set_y(self,double y):
        """
            Setters : Set the value of y

            =============== =========== ====================
            **Parameters**    **Type**    **Description**
            *y*                double      The value to set
            =============== =========== ====================

            Examples
            --------
            >>> p=Point(0,0,1)
            >>> print(p)
             ( 0.0 , 0.0 , 1.0 )
            printed
            >>> p.set_y(2)
            >>> print(p)
             ( 0.0 , 2.0 , 1.0 )
            printed
        """
        self.Y=y
    cpdef set_z(self,double z):
        """
            Setters : Set the value of z

            =============== =========== ====================
            **Parameters**    **Type**    **Description**
            *z*                double      The value to set
            =============== =========== ====================

            Examples
            --------
            >>> p=Point(1,0,0)
            >>> print(p)
             ( 1.0 , 0.0 , 0.0 )
            printed
            >>> p.set_z(2)
            >>> print(p)
             ( 1.0 , 0.0 , 2.0 )
            printed
        """
        self.Z=z
    cpdef double x(self):
        """
            getters : Get the value of x

            Returns
            -------
                double
                    The value of x.

            Examples
            --------
            >>> p=Point(3,2,1)
            >>> p.x()
            3.0
        """
        return self.X
    cpdef double y(self):
        """
            getters : Get the value of y

            Returns
            -------
                double
                    The value of y.

            Examples
            --------
            >>> p=Point(3,2,1)
            >>> p.y()
            2.0
        """
        return self.Y
    cpdef double z(self):
        """
            getters : Get the value of z

            Returns
            -------
                double
                    The value of z.

            Examples
            --------
            >>> p=Point(3,2,1)
            >>> p.z()
            1.0
        """
        return self.Z

        # basic operators redefinition
    cpdef Point op(self,Point B,str op):
        """
            Operator redefinition for the class Point.

            =============== ========== ===============================
            **Parameters**   **Type**   **Description**
            *B*              Point     The second member as a Point
            *op*             string      the operator to execute
            =============== ========== ===============================

            Returns
            -------
            Point
                The computed point operation

            Examples
            --------
            >>> a=Point(1,1,1)
            >>> b=a.copy()
            >>> print(a)
             ( 1.0 , 1.0 , 1.0 )
            printed
            >>> print(b)
             ( 1.0 , 1.0 , 1.0 )
            printed
            >>> print(a.op(b,'+'))
             ( 2.0 , 2.0 , 2.0 )
            printed
            >>> print(a.op(b,'-'))
             ( 0.0 , 0.0 , 0.0 )
            printed

            See Also
            --------
            Point.x
            Point.y 
            Point.z
        """
        if op=='+':
            return Point(self.x()+B.x(),self.y()+B.y(),self.z()+B.z())
        elif op=='-':
            return Point(self.x()-B.x(),self.y()-B.y(),self.z()-B.z())

    def __add__(self,p):
        """
            Ad hoc polymorphism 'add' function

            =============== =========== ===============================
            **Parameters**    **Type**    **Description**
            *p*                Point      The second operand as Point
            =============== =========== ===============================

            Returns
            -------
                Point
                    The translated point.

            Examples
            --------
            >>> a=Point(1,1,1)
            >>> b=Point(2,2,2)
            >>> print(a+b)
             ( 3.0 , 3.0 , 3.0 )
            printed
        """
        return self.op(p,'+')

    def __sub__(self,p):
        """
            Ad hoc polymorphism 'subb' function

            =============== =========== ===============================
            **Parameters**    **Type**    **Description**
            *p*                Point      The second operand as Point
            =============== =========== ===============================

            Returns
            -------
                Point
                    The translated point.

            Examples
            --------
            >>> a=Point(1,1,1)
            >>> b=Point(2,2,2)
            >>> print(a-b)
             ( -1.0 , -1.0 , -1.0 )
            printed
        """
        return self.op(p,'-')

    def __neg__(self):
        """
            Ad hoc polymorphism 'neg' function

            Returns
            -------
                Point
                    The opposite point.

            Examples
            --------
            >>> p=Point(1,2,3)
            >>> print(-p)
             ( -1.0 , -2.0 , -3.0 )
            printed
        """
        res=self.copy()
        res.set_x(-res.x())
        res.set_y(-res.y())
        res.set_z(-res.z())
        return res

    def __str__(self):
        """
            Genericity polymorphism 'str function'

            Examples
            --------
            >>> p=Point(0,0,0)
            >>> print(p)
             ( 0.0 , 0.0 , 0.0 )
            printed
        """
        self.print_screen()
        return "printed"

        # Utility

    cpdef void print_screen(self):
        """
            Utilitary screen printer : Print the Point coordonates.

            Examples
            --------
            >>> p=Point(1,2,3)
            >>> p.print_screen()
             ( 1.0 , 2.0 , 3.0 )

            See Also
            --------
            Point.x
            Point.y 
            Point.z
        """
        print(" ( "+str(self.x())+" , "+str(self.y())+" , "+str(self.z())+" ) ")

    cpdef Point copy(self):
        """
            Copy an instance of the current Point object

            Returns
            -------
                Point
                    The cloned Point object

            Examples
            --------
            >>> p=Point(1,2,3)
            >>> m=p.copy()
            >>> print(p)
             ( 1.0 , 2.0 , 3.0 )
            printed
            >>> print(m)
             ( 1.0 , 2.0 , 3.0 )
            printed

            See Also
            --------
            Point.x
            Point.y 
            Point.z
        """
        return Point(self.x(),self.y(),self.z())


cdef class Vector():
    """
        The vector object to compute 2 dimensions vectorial operations.

        ===============  ==========
        **Attributes**   **Type**
        *x*               Point
        *y*               Point
        ===============  ==========
    """
    cdef:
        Point x
        Point y
        double angle

    def __cinit__(self,*arg):
        if(len(arg)==6):
            self.x=Point(arg[0],arg[1],arg[2])
            self.y=Point(arg[3],arg[4],arg[5])
        else:
            self.x=arg[0]
            self.y=arg[1]

    # getters and setters
    cpdef void setPoints(self,Point x,Point y):
        """
            Setters : Set the vector from Points arguments

            =============== ========== =====================================
            **Parameters**   **Type**   **Description**
            *x*              Point       The origin of vecttor as Point
            *y*              Point       The destination of vector as Point
            =============== ========== =====================================

            Examples
            --------
            >>> v=Vector(0,0,0,1,2,3)
            >>> p=Point(0,0,0)
            >>> m=Point(3,2,1)
            >>> v.setPoints(p,m)
            >>> print(v)
             ( 3.0 , 2.0 , 1.0 )
            printed

            See Also
            --------
            Vector.setP1
            Vector.setP2
        """
        self.setP1(x)
        self.setP2(y)
    cpdef void setP1(self,Point x):
        """
            Setters : Set the origin of vector as Point
            
            =============== ========== ================================
            **Parameters**   **Type**   **Description**
            *x*              Point       The origin of vector as Point
            =============== ========== ================================

            Examples
            --------
            >>> v=Vector(0,0,0,1,2,3)
            >>> p=Point(3,3,3)
            >>> v.setP1(p)
            >>> print(v)
             ( -2.0 , -1.0 , 0.0 )
            printed
        """
        self.x=x
    cpdef void setP2(self,Point y):
        """
            Setters : Set the destination of vector as Point
            
            =============== ========== ================================
            **Parameters**   **Type**   **Description**
            *y*              Point       The origin of vector as Point
            =============== ========== ================================

            Examples
            --------
            >>> v=Vector(0,0,0,1,2,3)
            >>> p=Point(3,3,3)
            >>> v.setP2(p)
            >>> print(v)
             ( 3.0 , 3.0 , 3.0 )
            printed
        """
        self.y=y
    cpdef Point p1(self):
        """
            Getters : Get the origin of vector as Point.

            Returns
            -------
                Point
                    The origin of vector

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> v.p1()
            <algebra_3D.Point object at 0x0B39F318>
            >>> print(v.p1())
             ( 0.0 , 0.0 , 0.0 )
            printed
        """
        return self.x
    cpdef Point p2(self):
        """
            Getters : Get the destination of vector as Point.

            Returns
            -------
                Point
                    The destination of vector

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> print(v.p2())
             ( 2.0 , 2.0 , 2.0 )
            printed
        """
        return self.y
    cpdef double x1(self):
        """
            Getters : Get the x coordonate of the origin vector.

            Examples
            --------
            >>> v=Vector(1,2,3,4,5,6)
            >>> v.x1()
            1.0

            See Also
            --------
            Point.x
        """
        return self.x.x()
    cpdef double x2(self):
        """
            Getters : Get the x coordonate of the destination vector.

            Examples
            --------
            >>> v=Vector(1,2,3,4,5,6)
            >>> v.x2()
            4.0

            See Also
            --------
            Point.x
        """
        return self.y.x()
    cpdef double y1(self):
        """
            Getters : Get the y coordonate of the origin vector.

            Examples
            --------
            >>> v=Vector(1,2,3,4,5,6)
            >>> v.y1()
            2.0

            See Also
            --------
            Point.y
        """
        return self.x.y()
    cpdef double y2(self):
        """
            Getters : Get the y coordonate of the destination vector.

            Examples
            --------
            >>> v=Vector(1,2,3,4,5,6)
            >>> v.y2()
            5.0

            See Also
            --------
            Point.y
        """
        return self.y.y()
    cpdef double z1(self):
        """
            Getters : Get the z coordonate of the origin vector.

            Examples
            --------
            >>> v=Vector(1,2,3,4,5,6)
            >>> v.z1()
            3.0

            See Also
            --------
            Point.z
        """            
        return self.x.z()
    cpdef double z2(self):
        """
            Getters : Get the z coordonate of the destination vector.

            Examples
            --------
            >>> v=Vector(1,2,3,4,5,6)
            >>> v.z2()
            6.0

            See Also
            --------
            Point.z
        """
        return self.y.z()
    cpdef double angle(self):
        """
            Getters : Get the alpha angle between vector and norm.
            To fix : Please not use

            Returns
            -------
                double
                    The alpha angle between vecttor and norm

        """
        return self.angle
    cpdef Vector vect(self):
        """
            Get the absolute vector (from (0,0,0)).

            Returns
            -------
                Vector
                    The absolute vector from the self object

            Examples
            --------
            >>> v=Vector(1,1,1,3,3,3)
            >>> print(v.vect())
             ( 2.0 , 2.0 , 2.0 )
            printed

            See Also
            --------
            Vector.x1
            Vector.x2
            Vector.y1
            Vector.y2
            Vector.z1
            Vector.z2
        """
        cdef Vector res
        res=Vector(0,0,0,self.x2()-self.x1(),self.y2()-self.y1(),self.z2()-self.z1())
        return res


        # basic operators redefinition
    cpdef Vector op(self,Vector B,str op):
        """
            Operator redefinition for the class Point.

            =============== ========== ================================
            **Parameters**   **Type**   **Description**
            *B*              Vector     The second member as a Vector
            *op*             string      the operator to execute
            =============== ========== ================================

            Returns
            -------
            Vector
                The computed vector operation

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> w=Vector(1,1,1,4,4,4)
            >>> print(v.op(w,'+'))
             ( 5.0 , 5.0 , 5.0 )
            printed
            >>> print(v.op(w,'-'))
             ( -1.0 , -1.0 , -1.0 )
            printed
            >>> p=Point(1,2,3)
            >>> print(v.op(p,'*'))
             ( 2.0 , 4.0 , 6.0 )
            printed
            >>> print(v.op(10,'*'))
             ( 20.0 , 20.0 , 20.0 )
            printed

            See Also
            --------
            Vector.p1
            Vector.p2
            Point.x
            Point.y
            Point.z
        """
        if op=='+':
            return Vector(self.p1().x()+B.p1().x(),self.p1().y()+B.p1().y(),self.p1().z()+B.p1().z(),
                           self.p2().x()+B.p2().x(),self.p2().y()+B.p2().y(),self.p2().z()+B.p2().z())
        elif op=='-':
            return Vector(self.p1().x()-B.p1().x(),self.p1().y()-B.p1().y(),self.p1().z()-B.p1().z(),
                           self.p2().x()-B.p2().x(),self.p2().y()-B.p2().y(),self.p2().z()-B.p2().z())
        elif op=='*':
            if(isinstance(B,Point)):
                return Vector(self.p1().x()*B.x(),self.p1().y()*B.y(),self.p1().z()*B.z(),
                               self.p2().x()*B.x(),self.p2().y()*B.y(),self.p2().z()*B.z())
            else:
                return Vector(self.p1().x()*B,self.p1().y()*B,self.p1().z()*B,
                               self.p2().x()*B,self.p2().y()*B,self.p2().z()*B)

    def __add__(self,vec):
        """
            Ad hoc polymorphism 'add' function
            
            =============== ========== ==============================
            **Parameters**   **Type**   **description**
            *vec*            Vector     The second operand as vector
            =============== ========== ==============================

            Returns
            -------
                Vector
                    The computed added vector

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> w=Vector(1,1,1,4,5,6)
            >>> print(v+w)
             ( 5.0 , 6.0 , 7.0 )
            printed
        """
        return self.op(vec,'+')

    def __sub__(self,vec):
        """
            Ad hoc polymorphism 'sub' function
            
            =============== ========== ==============================
            **Parameters**   **Type**   **description**
            *vec*            Vector     The second operand as vector
            =============== ========== ==============================

            Returns
            -------
                Vector
                    The computed subbed vector

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> w=Vector(1,1,1,4,5,6)
            >>> print(v-w)
             ( -1.0 , -2.0 , -3.0 )
            printed
        """
        return self.op(vec,'-')

    def __mul__(self,coef):
        """
            Ad hoc polymorphism 'mul' function
            
            =============== ========== ==============================
            **Parameters**   **Type**   **description**
            *vec*            Vector     The second operand as vector
            =============== ========== ==============================

            Returns
            -------
                Vector
                    The computed multiplied vector

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> print(v*10)
             ( 20.0 , 20.0 , 20.0 )
            printed
        """
        return self.op(coef,'*')

    def __mod__(self,value):
        """
            Ad hoc polymorphism 'mod' function
            
            =============== ========== ==============================
            **Parameters**   **Type**   **description**
            *vec*            Vector     The second operand as vector
            =============== ========== ==============================

            Returns
            -------
                double
                    The length mod value

            Examples
            --------
            
        """
        return (self.length()%value)

    def __neg__(self):
        """
            Genericity polymorphism 'neg' function.

            Returns
            -------
                Vector
                    The opposite vector
        """
        self.setP1(-self.p1())
        self.setP2(-self.p2())

    def __contains__(self,vec):
        """
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
        """
        return (self.prod(vec)==Vector(0,0,0,0,0,0))

    def __str__(self):
        """
            Genericity polymorphism 'str function'
        """
        self.print_screen()
        return "printed"

    def __getitem__(self,key):
        """
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
        """
        if(key==0):
            return(self.vect().x2())
        elif(key==1):
            return(self.vect().y2())
        elif(key==2):
            return(self.vect().z2())

    def __setitem__(self,key,value):
        """
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
        """
        self.vect()
        p=self.p2().copy()
        if(key==0):
            p.set_x(value)
            self.setP2(p)
        elif(key==1):
            p.set_y(value)
            self.setP2(p)
        elif(key==2):
            p.set_z(value)
            self.setP2(p)

    def __len__(self):
        """
            Genericity polymorphism 'len' function

            Returns
            -------
                double
                    The enclidean length of the self vector object

            Examples
            --------

        """
        return self.length()

    def __eq__(self,vec):
        """
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
        """
        v1=self.vect()
        v2=vec.vect()
        return(v1[0]==v2[0] and v1[1]==v2[1] and v1[2]==v2[2])

    def __ne__(self,vec):
        """
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
        """
        v1=self.vect()
        v2=vec.vect()
        return(v1[0]!=v2[0] and v1[1]!=v2[1] and v1[2]!=v2[2])

    def __le__(self,vec):
        """
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
        """
        v1=self.vect()
        v2=vec.vect()
        return (v1.length()<=v2.length())

    def __lt__(self,vec):
        """
            Genericity polymorphism 'le' function

            =============== =========== ==========================
            **Parameters**   **Type**   **Description**
            *vec*            Vector     The second vector to test
            =============== =========== ==========================

            Returns
            -------
                bint
                    The Less Than test between the self vector object and the second vector as parameter

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> w=Vector(0,0,0,5,5,5)
            >>> print(v<w)
            True
            >>> print(w<v)
            False
        """
        v1=self.vect()
        v2=vec.vect()
        return (v1.length()<v2.length())

    def __ge__(self,vec):
        """
            Genericity polymorphism 'le' function

            =============== =========== ==========================
            **Parameters**   **Type**   **Description**
            *vec*            Vector     The second vector to test
            =============== =========== ==========================

            Returns
            -------
                bint
                    The Greater or Equal test between the self vector object and the second vector as parameter

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> w=Vector(0,0,0,5,5,5)
            >>> print(w>=v)
            True
            >>> print(v>=w)
            False
        """
        v1=self.vect()
        v2=vec.vect()
        return(v1.length()>=v2.length())

    def __gt__(self,vec):
        """
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
        """
        v1=self.vect()
        v2=vec.vect()
        return(v1.length()>v2.length())

        #Specific operators definition

    cpdef Vector prod(self,Vector vec):
        """
            Cross product self and vec.

            Returns
            -------
            double
                The prod result    

            Examples
            --------
            >>> v=Vector(0,0,0,1,2,1)
            >>> w=Vector(0,0,0,3,1,2)
            >>> print(v.prod(w))
             ( 3.0 , 1.0 , -5.0 )
            printed 

            See Also
            --------
            Vector.copy
            Vector.p1
            Vector.p2
            Point.x
            Point.y
            Point.z
        """
        cdef Vector v1=self.copy()
        cdef Vector v2=vec.copy()
        return Vector(0,0,0,v1.p2().y()*v2.p2().z()-v1.p2().z()*v2.p2().y(),v1.p2().z()*v2.p2().x()-v1.p2().x()*v2.p2().z(),v1.p2().x()*v2.p2().y()-v1.p2().y()*v2.p2().x())

    cpdef double dot(self,Vector vec):
        """
            Dot product self and vec.

            Returns
            -------
            double
                The dot result 

            Examples
            --------
            >>> v=Vector(0,0,0,1,2,1)
            >>> w=Vector(0,0,0,3,1,2)
            >>> print(v.dot(w))
            7.0

            See Also
            --------
            Vector.vect
            Vector.p1
            Vector.p2
            Point.x
            Point.y
            Point.z
        """

        cdef:
            Vector v1
            Vector v2

        v1=self.vect()
        v2=vec.vect()
        return v1.p2().x()*v2.p2().x()+v1.p2().y()*v2.p2().y()+v1.p2().z()*v2.p2().z()

    def length(self):
        """ 
            Get the norm of self vector.

            Returns
            -------
            float
                The euclidian length of the vector

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> print(v.length())
            3.4641016151377544

            See Also
            --------
            Vector.copy
            Vector.vect
        """
        cdef Vector vec
        cdef double res

        vec=self.copy()
        vec.vect()
        # res=vec.dot(vec)**(1/2)
        res=np.sqrt((vec[0]*vec[0]+vec[1]*vec[1]+vec[2]*vec[2]))
        return res

    cpdef Vector translate(self,point=Point(0,0,0)):
        """
            Translate self vector to the given Point.

            =============== ========== ===================================
            **Parameters**   **Type**   **Description**
            *point*          Point      The translation destination point
            =============== ========== ===================================

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> print(v.translate(Point(1,1,1)).p1())
             ( 1.0 , 1.0 , 1.0 )
            printed
            >>> print(v.translate(Point(1,1,1)).p2())
             ( 3.0 , 3.0 , 3.0 )
            printed

            See Also
            --------
            Vector.vect
            Vector.x2
            Vector.y2
            Vector.z2
            Point.x
            Point.y
            Point.z
        """
        cdef Vector vect
        vect=self.vect()
        return Vector(point.x(),point.y(),point.z(),vect.x2()+point.x(),vect.y2()+point.y(),vect.z2()+point.z())

    cpdef Vector unitVector(self):
        """
            Get unit vector from self.

            Returns
            -------
                Double
                    The unit vector from self (divided by the enclidean length) 

            Examples
            --------

            See Also
            --------
            Vecotr.copy
            Vector.length
        """
        cdef Vector res 
        res=self.copy()
        return res*(1/res.length())

        #Utility

    cpdef void print_screen(self):
        """
            Utilitary screen printer.
        """
        print(" ( "+str(self.p2().x()-self.p1().x())+" , "+str(self.p2().y()-self.p1().y())+" , "+str(self.p2().z()-self.p1().z())+" ) ")

    cpdef Vector copy(self):
        """
            Copy an instance of the current Vector object

            Returns
            -------
                Point
                    The cloned Vector object

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> w=v.copy()
            >>> v==w
            True

            See Also
            --------
            Vector.p1
            Vector.p2
            Point.x
            Point.y
            Point.z
        """
        return Vector(self.p1().x(),self.p1().y(),self.p1().z(),self.p2().x(),self.p2().y(),self.p2().z())

    cpdef Point pointAt(self,double t):
        """
            Get the point result after a translation by self vector, scaling by t.

            =============== ========== ====================================
            **Parameters**   **Type**   **Description**
            *t*              double     The scale range of the translation
            =============== ========== ====================================

            Returns
            -------
            Point
                The translated point.

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> print(v.pointAt(1))
             ( 2.0 , 2.0 , 2.0 )
            printed
            >>> print(v.pointAt(2))
             ( 4.0 , 4.0 , 4.0 )
            printed
            >>> print(v.pointAt(3))
             ( 6.0 , 6.0 , 6.0 )
            printed

            See Also
            --------
            Vector.p1
            Vector.p2
            Point.x
            Point.y
            Point.z
        """
        cdef:
            double interval_x
            double interval_y
            double interval_z
            double x
            double y
            double z

        interval_x=self.p2().x()-self.p1().x()
        interval_y=self.p2().y()-self.p1().y()
        interval_z=self.p2().z()-self.p1().z()
        x=self.p1().x()+t*interval_x
        y=self.p1().y()+t*interval_y
        z=self.p1().z()+t*interval_z
        return Point(x,y,z)

    cpdef void setLength(self,double length,int precision=6):
        """
            Change the length of the vector without lambda-multiplication (you can define a precise length).

            =============== ========== =================================================
            **Parameters**   **Type**   **Description**
            *length*         double     The new length of the self vector
            *precision*      int        The precision indice : bigger mean more precise
            =============== ========== =================================================

            Examples
            --------
            >>> v=Vector(0,0,0,2,2,2)
            >>> print(v.length())
            3.4641016151377544
            >>> v.setLength(4)
            >>> print(v)
             ( 2.309402000000009 , 2.309402000000009 , 2.309402000000009 )
            printed
            >>> print(v.length())
            4.0000015991011955

            See Also
            --------
            Vector.length
            Vector.setP2
            Vector.x2
            Vector.y2
            Vector.z2
        """
        cdef double interp

        interp=1/10**precision
        if (self.length()>length):
            while (self.length()>length):
                if(self.length()-length>0.01): 
                    self.setP2(Point(self.x2()-interp*1000,self.y2()-interp*1000,self.z2()-interp*1000))
                elif(self.length()-length>0.0001):
                    self.setP2(Point(self.x2()-interp*10,self.y2()-interp*10,self.z2()-interp*10))
                else:
                    self.setP2(Point(self.x2()-interp,self.y2()-interp,self.z2()-interp))
        else:
            while (self.length()<length):
                if(length-self.length()>0.01):
                    self.setP2(Point(self.x2()+interp*1000,self.y2()+interp*1000,self.z2()+interp*1000))
                elif(length-self.length()>0.0001):
                    self.setP2(Point(self.x2()+interp*10,self.y2()+interp*10,self.z2()+interp*10))
                else:
                    self.setP2(Point(self.x2()+interp,self.y2()+interp,self.z2()+interp))

    cpdef bint hortogo(self,Vector vec):
        """
            Test the hortogonal proprieties of self vector and given vec.

            =============== ========== ==============================
            **Parameters**   **Type**   **Description**
            *vec*             Vector   The vector to test with self
            =============== ========== ==============================

            Returns
            -------
            int
                * 0 : Vectors are not hortgonal
                * 1 : Vectors are hortogonal

            Examples
            --------
            >>> u=Vector(0,0,0,1,0,0)
            >>> v=Vector(0,0,0,0,1,0)
            >>> print(u.hortogo(v))
            True

            See Also
            --------
            Vector.dot
        """
        return(self.dot(vec)==0)

    cpdef double cos(self,Vector vec):
        """
            Get a fast computed cos from self vector and vec vector.
            The operation is realized if and only if the two vectors have the same origin.

            =============== ========== ===========================================
            **Parameters**   **Type**   **Description**
            *vec*            Vector    The vector angle-oriented with self vector
            =============== ========== ===========================================

            Returns
            -------
            double
                The computed cosine.

            Examples
            --------
            >>> v=Vector(0,0,0,1,0,0)
            >>> u=Vector(0,0,0,0,1,0)
            >>> v.cos(u)
            0.0

            See Also
            --------
            Vector.p1
            Vector.vect
            Vector.dot
            Vector.length
            Point.x
            Point.y
            Point.z
        """
        cdef Vector v1
        cdef Vector v2
        if not ((self.p1().x()==vec.p1().x()) and (self.p1().y()==vec.p1().y()) and (self.p1().z()==vec.p1().z())):
            v1=self.vect()
            v2=vec.vect()
        return(self.dot(vec)/(self.length()*vec.length()))

    cpdef double angle_vec(self,Vector vec,int mode=1):
        """
            Get the angle between two vectors.
            The operation is realized if and only if the two vectors have the same origin.

            =============== ========== ===========================================
            **Parameters**   **Type**   **Description**
            *vec*            Vector    The vector angle-oriented with self vector
            *mode*           int       The angle unit :
                                            * 0 => radians
                                            * 1 => degrees
            =============== ========== ===========================================

            Returns
            -------
            double
                The angle between the two vectors.

            Examples
            --------
            >>> u=Vector(0,0,0,1,0,0)
            >>> v=Vector(0,0,0,0,1,0)
            >>> u.angle_vec(v)
            90.00003218077504
            >>> u.angle_vec(v,0)
            1.5707963267948966

            See Also
            --------
            Vector.cos
        """
        if mode:
            return np.arccos(self.cos(vec))*57.2958
        else:
            return np.arccos(self.cos(vec))

def fromPolar(angle,length=1):
    # Return the vector from angle, unit vector as default
    return Vector(0,0,length+np.cos(angle),length+np.sin(angle))