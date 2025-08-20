# elixir uses curly brackets to define tuples and can hold any values just like lists

tupleExample = {"ok", "elephant", 1, 2, "Sher", :ok}
IO.inspect(tupleExample)
IO.puts(tuple_size(tupleExample))

# Tuples store elements contiguously in memory. This means accessing a tuple element by index or getting the tuple size is a fast operation. Indexes start from zero:
IO.puts(elem(tupleExample, 1)) # elephant

newTupleExample=put_elem(tupleExample, 1, "world") #this is the way of placing elements in the tuple, if there is an element already then it replaces that
IO.inspect(newTupleExample)
# Notice that put_elem returned a new tuple. The original tuple stored in the tuple variable was not modified. Like lists, tuples are also immutable. Every operation on a tuple returns a new tuple, it never changes the given one.

IO.inspect(tupleExample) # the original one is still the same but the put_elem returns a new one so we can IO.inspect that
newTupleExample2=put_elem(tupleExample, 6, "nope") # this is not going to work because the size of tuple falls short

