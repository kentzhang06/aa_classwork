def is_prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num%factor == 0
            return false
        end
    end

    return true
end

def nth_prime(n)
    count = 0
    #loop from 2...infinite
    (2...9999).each do |factor|
        if is_prime?(factor)
            count += 1
            return factor if count == n
        end

    end

    return n
end

def prime_range(min, max)

    (min..max).select { |n| is_prime?(n) }
    #return an array of all prime numbers between min and max
end