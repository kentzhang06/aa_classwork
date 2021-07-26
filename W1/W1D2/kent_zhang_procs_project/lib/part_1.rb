def my_map(array, &prc)
    new_array = []

    array.each { |ele| new_array << prc.call(ele)}

    return new_array
end

def my_select(array, &prc)
    new_array = []

    array.each { |ele| new_array << ele if prc.call(ele)}

    return new_array
end

def my_count(array, &prc)
    count = 0

    array.each { |ele| count += 1 if prc.call(ele)}

    return count
end

def my_any?(array, &prc)
    array.each do |ele|
        if prc.call(ele)
            return true
        end
    end

    return false
end

def my_all?(array, &prc)
    array.each do |ele|
        if !prc.call(ele)
            return false
        end
    end

    return true
end

def my_none?(array, &prc)
    array.each do |ele|
        if prc.call(ele)
            return false
        end
    end

    return true
end

