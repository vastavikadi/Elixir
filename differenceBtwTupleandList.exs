# Lists are stored in memory as linked lists, meaning that each element in a list holds its value and points to the following element until the end of the list is reached. This means accessing the length of a list is a linear operation: we need to traverse the whole list in order to figure out its size.

# Similarly, the performance of list concatenation depends on the length of the left-hand list:

list = [1, 2, 3]

# This is fast as we only need to traverse `[0]` to prepend to `list`
IO.inspect([0] ++ list)

# This is slow as we need to traverse `list` to append 4
IO.inspect(list ++ [4])
IO.inspect(list) # original list is still same hence confirms no mutation



# Tuples, on the other hand, are stored contiguously in memory. This means getting the tuple size or accessing an element by index is fast. On the other hand, updating or adding elements to tuples is expensive because it requires creating a new tuple in memory:

tuple = {:a, :b, :c, :d}
IO.inspect(put_elem(tuple, 2, :e))

# You might think Elixir copies all elements :a, :b, :d into t2.
# But it doesn’t—instead, Elixir reuses (shares) the existing memory references for those elements, and only allocates the new one :x.

# and this is called Structural sharing
# Both t1 and t2 point to the same memory for :a, :b, and :d.
# Only the updated element (:x) is new.

# Because of the immutability in tuples, it guarantees that once t1 is created, :a, :b, :c, and :d cannot change.
# So Elixir can safely reuse those values without worrying that modifying t2 will corrupt t1.

# This saves a lot of memory allocations and makes updates efficient.


###IMPORTANT POINTS
# When to use Lists
# Variable size: The number of elements can change depending on the operation.
# Sequential access: Great when you often process elements one by one (pattern matching, recursion, iteration).
# Cheap head/tail decomposition: Easy to split into first element (head) and the rest (tail).
# Use case: when the size of the result is unknown or variable.


# When to use Tuples
# Fixed size: Once created, the number of elements never changes.
# Random access: Accessing the nth element is fast.
# Whole structure replacement on update (but with structural sharing to optimize).
# Use case: when you always know the exact number of return values.
# Always returns two pieces, no matter what → tuple is the right choice. (good for “exactly n” results)

# Example to make it clear
# The String.split function breaks a string into a list of strings on every whitespace character. Since the amount of elements returned depends on the input, we use a list.
String.split("hello world") # returns ["hello", "world"]
String.split("hello beautiful world") # returns ["hello", "beautiful","world"]


# On the other hand, String.split_at splits a string in two parts at a given position. Since it always returns two entries, regardless of the input size, it returns tuples:
String.split_at("hello world", 3)# {"hel", "lo world"}

String.split_at("hello world", -4)#{"hello w", "orld"}

# It is also very common to use tuples and atoms to create "tagged tuples", which is a handy return value when an operation may succeed or fail. For example, File.read reads the contents of a file at a given path, which may or may not exist. It returns tagged tuples:

File.read("path/to/existing/file")# if exists it returns {:ok, "... contents ..."}

File.read("path/to/unknown/file")# it returns this if not existing: {:error, :enoent}


# If the path given to File.read exists, it returns a tuple with the atom :ok as the first element and the file contents as the second. Otherwise, it returns a tuple with :error and the error description. As we will soon learn, Elixir allows us to pattern match on tagged tuples and effortlessly handle both success and failure cases.

# there is an elem function to access a tuple item:
tuple = {:ok, "hello"}
elem(tuple, 1)# returns "hello"


# NOTE: However, given you often don't know the number of elements in a list, there is no built-in equivalent for accessing arbitrary entries in a lists, apart from its head.


#SIMPLE RULE:
# If counting is constant time → the function name uses size.
# Means: The value is either pre-stored or instantly available without scanning the structure.

# Always takes the same amount of time regardless of input size.
# If counting is linear time → the function name uses length.
# Means: Elixir has to traverse the structure to count elements.
# The bigger the structure, the slower the count.
# Mnemonic: Length = Linear.
#EXAMPLE:
# We have used 4 counting functions so far: byte_size (for the number of bytes in a string), tuple_size (for tuple size), length (for list length) and String.length (for the number of graphemes in a string). We use byte_size to get the number of bytes in a string, which is a cheap operation. Retrieving the number of Unicode graphemes, on the other hand, uses String.length, and may be expensive as it relies on a traversal of the entire string.
