# JuliaClass101.jl

# Julia is a low ceremony language like Python
# but built for concurrency like Clojure
# and fast like C++, but with multiple dispatch

# Julia is built on top of the LLVM which powers
# languages like Swift (Apple).

# Basic tour of types
# Julia is type optional. The base type is

println("Hello, World.") # wake up the compiler

type my_type # creates a type, can be a sub-type of an existing type
  foo::Any
  bar::Int64
  qux::Float64
  baz::Bool
end

# note there are no line terminators, and blocks are closed with "end".

# Foo is an open variable with no defined type. It can hold a string,
# a byte, a data frame, or anything. You don't need to declare or give
# a type to spontaneously created variables. Example:

foobar = 42.0000000042

# You can declare a function formally...

function funtimes(x,y,z=0)
  return x*y+z
end

funtimes(1,2,3)
funtimes(1,2)

# The z is optional and has a default. This is similar to R
# you can make varialbes that are actually collections as well by using
# an ellipse

function morefuntimes(x,y,z...)
  return map(zed -> zed/(x+y), z) # map a lambda to an array
end

z_collection = morefuntimes(1, 2, 5, 10, 15, 20, 25)

typeof(z_collection)

println("The value of π is: ", π) # Julia works with unicode natively

x = 2.0
y = 3.148

if x < π < y # julia is ok with stringing arbitrary comparisons
  println("Pi is between the bottom and top threshold.")
else
  println("Pi is not between the thresholds.")
end

# functions don't need ceremony. For example:

newfunc(x) = return π * x^2

newfunc(8.5)

# lambdas are un-named functions that can be dropped into
# just about anywhere. They are a concept from functional
# languages like Lisp.

# Let's turn a vector of radii into a vector of surface area

radiivec = [10.0 15.0 25.0 35.0 50.0]
map!(x -> π * x^2, radiivec) # the ! (aka bang!) means mutate
                             # the original source
radiivec

# arrays are "wicked powerful" in Julia. You can use vectors
# and arrays in very interesting and useful ways in Julia.

verticalarray = [1,2,3,4,5] # this is of type Vector
horizontalarray = [11 22 33 44 55] # this is of type Matrix

# the commas make all the difference

mymatrix = [1 1; 2 2; 3 3] # This makes a 3x2 Array
