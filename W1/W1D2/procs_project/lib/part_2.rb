def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    sentence.split(" ").map {|word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    arr.select {|ele| prc1.call(ele) && prc2.call(ele)}
end

def alternating_mapper(arr, prc1, prc2)

    arr.map.each_with_index do |el,i|  
        if i.even? 
            prc1.call(el)
        else
            prc2.call(el)
        end
    end
end