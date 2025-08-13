# elixir does have something like arrays but can store values of any type. Just like the Union of string[]|num[] in Typescript.

randomValues = [1, 2, true, 3]
IO.inspect(randomValues) # instead of puts we use inspect to print lists in elixir
IO.puts(length([1, 2, 3])) # 3


# list can be concatenated and subtracted using ++ and -- operators

IO.inspect([1, 2, 3] ++ [4, 5, 6]) # [1, 2, 3, 4, 5, 6]
IO.inspect([1, 2, 3] -- [2]) # [1, 3]
IO.inspect([1, true, 2, false, 3, true] -- [true, false]) # [1, 2, 3, true]

# List operators never modify the existing list. Concatenating to or removing elements from a list returns a new list. Elixir data structures are immutable. One advantage of immutability is that it leads to clearer code. You can freely pass the data around with the guarantee no one will mutate it in memory - only transform it.

# lets find the head and tail of a list

head = hd(randomValues)
tail = tl(randomValues)

IO.inspect(head) # 1
IO.inspect(tail) # [2, true, 3]

# Getting the head or the tail of an empty list throws an error:
# hd([])
# ** (ArgumentError) argument error

wordsFromList = [104, 101, 108, 108, 111]
IO.inspect(wordsFromList) # this is the result : = ~c"hello" preceded by ~c ( it means this is charlist and In Elixir, a charlist is a list of integers where each integer is a Unicode codepoint (for ASCII characters, this matches the byte values).)


# When Elixir sees a list of printable ASCII numbers, Elixir will print that as a charlist (literally a list of characters). Charlists are quite common when interfacing with existing Erlang code. Whenever you see a value in IEx and you are not quite sure what it is, you can use i to retrieve information about it:
# i ~c"hello" like this in IEx

# Whole context
# In Elixir, there are two main text-like data structures:
# String	"hello"	INernal Storage:- Binary (UTF-8 bytes in one chunk)	Description: Fast, contiguous in memory, what most languages mean by “string”
# Charlist	~c"hello" or [104,101,108,108,111]	Interal Storage: - Linked list of integers (each integer = Unicode codepoint)	Description: Common in Erlang, slower, but works well for pattern matching per character

# When you type in IEx:
# [104, 101, 108, 108, 111]
# Elixir says:
# "Hmm, all these integers are printable ASCII characters. Instead of showing you the raw list, I’ll pretty-print it as ~c"hello" so you know it’s a charlist."
# That’s just a display choice in IEx — the actual data is still [104, 101, 108, 108, 111].
