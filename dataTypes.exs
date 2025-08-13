# 1          # integer
# 0x1F       # integer
# 1.0        # float
# true       # boolean
# :atom      # atom / symbol
# "elixir"   # string
# [1, 2, 3]  # list
# {1, 2, 3}  # tuple

# In Elixir, the operator / always returns a float.

IO.puts(1/2) # this is going to be float


# If you want to do integer division or get the division remainder, you can invoke the div and rem functions:
IO.puts(div(10, 2))
IO.puts(div(10, 2)) # going to return integer as result
IO.puts(rem(10, 3)) # going to return reminder

int_div = div 10, 2 # this also works as a syntax because Elixir allows you to drop the parentheses when invoking functions that expect one or more arguments.
IO.puts(int_div)

# Elixir also supports shortcut notations for entering binary, octal, and hexadecimal numbers:
# 0b1010 = 10
int_num1= 0b1010
IO.puts(int_num1) # 10


# Float numbers require a dot followed by at least one digit and also support e for scientific notation. Floats in Elixir are 64-bit precision.
int_float = 1.0e-10
IO.puts(int_float) # 1.0e-10

# You can invoke the round function to get the closest integer to a given float, or the trunc function to get the integer part of a float.
IO.puts(round(3.58)) # 4
IO.puts(trunc(3.58)) # 3

# Elixir provides several predicate functions to check for the type of a value. For example, is_integer can be used to check if a value is an integer or not:
# You can also use is_float or is_number to check, respectively, if an argument is a float, or either an integer or float.
IO.puts(is_integer(43294.533)) # false

# Elixir also provides three boolean operators: or, and, and not. These operators are strict in the sense that they expect something that evaluates to a boolean (true or false) as their first argument
IO.puts(false or is_boolean(true)) # true and NOTE: idhr phla argument true ya false hi dena otherwise error aayega like this: ** (BadBooleanError) expected a boolean on left-side of "and"


# or and and are short-circuit operators. They only execute the right side if the left side is not enough to determine the result means if phle hi false hai in "and" then does not matter aage kya hai
# false and raise("This error will never be raised") it gives =  false
# true or raise("This error will never be raised")it gives = true


# Elixir also provides the concept of nil, to indicate the absence of a value, and a set of logical operators that also manipulate nil: ||/2, &&/2, and !/1. For these operators, false and nil are considered "falsy", all other values are considered "truthy":

# or
# 1 || true = 1
# false || 11 = 11

#and
# nil && 13 = nil
# true && 17 = 17

# not
# !true = false
# !1 = false
# !nil = true

# Similarly, values like 0 and "", which some other programming languages consider to be "falsy", are also "truthy" in Elixir.

# As a rule of thumb, use and, or and not when you are expecting booleans. If any of the arguments are non-boolean, use &&, || and !.


# An atom is a constant whose value is its own name. Some other languages call these symbols. They are often useful to enumerate over distinct values, such as:

IO.puts(:apple) # this comes out to be apple itself and this is what we call atoms
# atoms are equal if there names are equal like: :apple == :apple comes to be true

# atoms are used to define the state of an operator such as :ok and :error
#Elixir allows you to skip the leading : for the atoms false, true and nil.
# The booleans true and false are also atoms:
IO.puts(true == :true) # gives out true
IO.puts(is_atom(false)) # this is true
IO.puts(is_boolean(:false)) # this is also true
