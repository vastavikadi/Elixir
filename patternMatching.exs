# Livebook is a jupyter notebook (like) for Elixir
# Here it means: “match the variable name with the value "Elephant". Since name is unbound, it simply gets bound to "Elephant"
name = "Elephant"
IO.puts("Elephant"==name) # returns true means the name and the elephant are matching and '=' is not an assignment operator. Because both sides of the comparison evaluate to the exact same binary string "Elephant".

# "lion" = name1 # not going to work because name1 needs to  be on the LHS and not on RHS
# IO.puts(name1 == "lion")

# [a,a]=[1,1] #If a variable is mentioned more than once in a pattern, all references must bind to the same value
# IO.puts(a) returns 1

# [a,a]=[1,2]
# IO.puts(a) a is already bound to 1 so cant be bound to 2 now

# [a,b]=[1,2] # = is also used to destructuring datatypes
# IO.puts(a)
# IO.puts(b) a to 1 and b to 2

#NOTE:
# A pattern match error will occur if the sides can't be matched, for example if the tuples have different sizes:

# {a, b, c} = {:hello, "world"}
# ** (MatchError) no match of right hand side value: {:hello, "world"}

# and also when: And also when comparing different types, for example if matching a tuple on the left side with a list on the right side:

# {a, b, c} = [:hello, "world", 42]
# ** (MatchError) no match of right hand side value: [:hello, "world", 42]

# a=1
# IO.puts(a) returns 1 means a is now bound to 1. Notice that 1 = x is a valid expression, and it matched because both the left and right side are equal to 1(a =1 and 1=1 and = is called the match operator). When the sides do not match, a MatchError is raised.

a=2
IO.puts(a) #returns 2 means a is now bound to 2 but we have studied datatypes are immutable in elixir well they are but here doing this elixir thinks we are bounding 'a' to a new value and it lets us.
# to avoid this we can use pin operator which restricts the value bounding of 'a' to a new value

# ^a=3
# IO.puts(a) # the error we get: ** (MatchError) no match of right hand side value: 3
# patternMatching.exs:26: (file)
# (elixir 1.18.2) lib/code.ex:1525: Code.require_file/2
# the same error on 3=a too


# 1=unknown A variable can only be assigned on the left side of =: otherwise this error: ** (CompileError) iex:1: undefined variable "unknown"



#We can also match on specific values like LHS and RHS will only match if there are some same values
{:ok, result}={:ok,13}
IO.puts(result) # returned 13 and it means if the starting values on the both side (:ok) is same then only match
# {:ok, result} = {:error, :oops}
# ** (MatchError) no match of right hand side value: {:error, :oops}


# we can pattern match on lists too

# [a, b] = [1, 2]
# IO.puts(a) # returns 1
# IO.puts(b) # returns 2

# a list also supports matching on head and tail but not with an empty list
# [head | tail] = [1, 2, 3]
# IO.puts(head) # returns 1
# IO.puts(tail) # returns [2, 3]

# The [head | tail] format is not only used on pattern matching but also for prepending items to a list:

# list = [1, 2, 3]
# [0 | list] # returns # [0, 1, 2, 3] and hence it is used to prepend the values as well

# In some cases, you don't care about a particular value in a pattern. It is a common practice to bind those values to the underscore, _. For example, if only the head of the list matters to us, we can assign the tail to underscore:

# [head | _] = [1, 2, 3] # something similar in Go
# [1, 2, 3]
# head
# 1

# The variable _ is special in that it can never be read from. Trying to read from it gives a compile error:

# _
# ** (CompileError) iex:1: invalid use of _. "_" represents a value to be ignored in patterns.


#NOTE:
# Although pattern matching allows us to build powerful constructs, its usage is limited. For instance, you cannot make function calls on the left side of a match. The following example is invalid:

# length([1, [2], 3]) = 3
# ** (CompileError) iex:1: cannot invoke remote function :erlang.length/1 inside match
