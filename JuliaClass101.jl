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

function fun_times(x,y,z=0)
  return x*y+z
end

fun_times(1,2,3)
fun_times(1,2)

# The z is optional and has a default. This is similar to R
# you can make varialbes that are actually collections as well by using
# an ellipse

function more_fun_times(x,y,z...)
  return map(zed -> zed/(x+y), z) # map a lambda to an array
end

z_collection = more_fun_times(1, 2, 5, 10, 15, 20, 25)

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

vertical_array = [1,2,3,4,5] # this is of type Vector
horizontal_array = [11 22 33 44 55] # this is of type Matrix

# the commas make all the difference

my_matrix = [1 1; 2 2; 3 3] # This makes a 3x2 Array

my_big_matrix = randn(10,10)

# the basic arithmetic functions already work elementwise on
# things like this matrix. example

transformed_matrix = my_big_matrix * 5

# however, most other things do not work this way.

# this fails, because the compare operator does not work
# elementwise across the matrix.
transformed_matrix > 3

# this works, because the dot operator vectorizes the comparison!
transformed_matrix .> 3

# lets use the dot notation to broadcast a parse to strings to
# create an array of integers. Consider the following string:

s = "1 2 3 4 5"

# iterating this and creating an array is actually pretty darn easy

numbers = split(s) # ok close but they are still strings

parse(numbers[1]) #Even closer

int_s =  parse.(split(s)) # the dot broadcasts the parse to the vector

# another way is to use an array comprehension
int_s = [parse(Int, ss) for ss in split(s)]

# neither way is more correct. There are always alternative means to any end.

# here is another matrix
x = randn(10,10)
x2 = copy(x) # we use copy because = will only refer back to x!

# lets look at some interesting iterators

for i in CartesianRange(size(x))
  x2[i] = sqrt(abs(x[i]))
end

# adding new functionality is easy if you have a
# github account (free). Julia comes with git built in
# but is compatible with whatever version of git you have
# installed locally

# Pkg.add("DeepDiffs")
# Pkg.update()

# Here is how to include a package
using DeepDiffs

deepdiff([1,2,7,3],[2,3,4,1,2,3,5])

# this shows how to turn vector a into vector b.

using Gadfly # julia's version of The Grammar of Graphics
using RDatasets # those familiar with R will recognize these sets

iris = dataset("datasets", "iris")
p = plot(iris, x=:SepalLength, y=:SepalWidth, Geom.point)
img = SVG("iris_plot.svg", 12inch, 8inch)
draw(img, p)

function get_to_it(d)
  ppoint = plot(d, x=:SepalLength, y=:SepalWidth, Geom.point)
  pline = plot(d, x=:SepalLength, y=:SepalWidth, Geom.line)
  ppoint, pline
end
ps = get_to_it(iris)
map(display, ps)

plot(iris, x=:SepalLength, y=:SepalWidth, Geom.point, Geom.line)

plot(iris, x=:SepalLength, y=:SepalWidth, color=:Species, Geom.point)

gasoline = dataset("Ecdat", "Gasoline")

plot(gasoline, x=:Year, y=:LGasPCar, color=:Country, Geom.point, Geom.line)
