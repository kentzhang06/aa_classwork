def my_reject(array, &prc)

    array.select { |ele| !prc.call(ele)}
    #return new array containing elements from original array that resulted in false
    #when passed in the block

end

def my_one?(array, &prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end

    if count == 1
        return true
    else
        return false
    end
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k, v|
        if prc.call(k, v)
            new_hash[k] = v
        end
    end

    return new_hash

end

def xor_select(array, prc1, prc2)
    new_array = []
    array.each do |ele|
        if !prc1.call(ele) && prc2.call(ele) || prc1.call(ele) && !prc2.call(ele)
            new_array << ele
        end
    end

    new_array
end

def proc_count(value, array)
    count = 0
    array.select do |p|
        if p.call(value)
            count += 1
        end
    end

    count
end