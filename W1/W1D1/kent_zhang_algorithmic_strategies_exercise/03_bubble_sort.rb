# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)
    sorted = false #default sorted flag to false

    while !sorted #loop until sorted = true
        sorted = true #set sorted to true

        (0...arr.length - 1).each do |i| #iterate through indices 0 to arr.length - 1 excluding
            if arr[i] > arr[i+1] #check if next index is greater than current index, swap if so
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false #set sorted to false to continue
            end
        end
    end

    arr #return arr
end


p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]