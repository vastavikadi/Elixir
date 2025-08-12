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
