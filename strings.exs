string_word = "Hey World" # only double quotes and are UTF-8 encoded (Unicode is a character set. It translates characters to numbers. UTf-8 is an encoding standard. It translates numbers into binary.) Strings in elixir: You see letters, but under the hood, Elixir has to store them as numbers (Unicode code points), which then become bytes in memory.

IO.puts(string_word)


# to concatenate strings use <> operator

string_word2= "It's me"
IO.puts(string_word <> " "<>string_word2)


# elixir also supports interpolation
IO.puts("Not so #{string_word}") # like template literal in JS, always remember to use double quotes

IO.puts("hello\nworld")


#strings in elixir are stored Contiguous means the bytes are stored back-to-back in memory, without gaps.
# In Elixir, binary is a general data type for storing raw bytes.
# so in short Strings in Elixir are represented internally by contiguous sequences of bytes known as binaries
IO.puts(is_binary(string_word)) #true
IO.puts(byte_size(string_word)) #to get the byte size here it is 9 as it has 9 letters and each letter takes a minimum of 9 bytes letters take 1 byte and emojis take 4


# to get the length of the string we can use
IO.puts(String.length(string_word))

# The String module contains a bunch of functions that operate on strings as defined in the Unicode standard
IO.puts(String.upcase(string_word)) # makes it uppercase


# same as js == checks for the value alone and === checks for type as well as the value
IO.puts(1===1.0) # false
