# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

def union(*arrays)
    new_arr = []

    arrays.each { |arr| new_arr += arr}

    return new_arr

end


p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
