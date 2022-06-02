# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers

require "byebug"
def least_common_multiple(num_1, num_2)
    (1..num_2).each do |ele|
        x = ele * num_1
        if x % num_2 == 0
            return x
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_hash = Hash.new(0)
    str.each_char.with_index do |ele, idx|
        if str[idx + 1] != nil
            bigram_hash[ele + str[idx + 1]] += 1
        end
    end
    largest = 0
    bigram = ""
    bigram_hash.each do |key, val|
        if val > largest
            bigram = key
            largest = val
        end
    end
    bigram
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = Hash.new
        self.each do |key, val|
            new_hash[val] = key
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        sum = 0
        self.each_with_index do |ele_0, idx_0|
            self.each_with_index do |ele_1, idx_1|
                if idx_0 < idx_1 && num == (ele_0 + ele_1)
                    sum += 1
                end
            end
        end
        sum
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        store = 0
        if prc == nil
            i = 1
            while i == 1
                i = 0
                self.each_with_index do |ele_0, idx_0|
                    if self[idx_0 + 1] != nil
                        if self[idx_0] > self[idx_0 + 1]
                            i = 1
                            store = self[idx_0] 
                            self[idx_0] = self[idx_0 + 1]
                            self[idx_0 + 1] = store
                        end
                    end
                end
            end
            return self
        end

        if prc != nil
            i = 1
            while i == 1
                i = 0
                self.each_with_index do |ele_0, idx_0|
                    if self[idx_0 + 1] != nil
                        if prc.call(self[idx_0], self[idx_0 + 1]) == 1
                            i = 1
                            store = self[idx_0] 
                            self[idx_0] = self[idx_0 + 1]
                            self[idx_0 + 1] = store
                        end
                    end
                end
            end
            return self
        end
                            



    end
end
