# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
require "byebug"
def all_vowel_pairs(words)
    vowels = ["a", "e", "i", "o", "u"]
    ret_arr = []
    words.each_with_index do |ele_0, idx_0|
        words.each_with_index do |ele_1, idx_1|
            new_str = ""
            if idx_0 < idx_1
                new_str += ele_0 + ele_1
                if new_str.include?(vowels[0]) && new_str.include?(vowels[1]) && new_str.include?(vowels[2]) && new_str.include?(vowels[3]) && new_str.include?(vowels[4]) 
                    ret_arr << (ele_0 + " " + ele_1)
                end
            end
        end
    end
    ret_arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2..(num - 1)).each do |ele|
        if num % ele == 0
            return true
        end
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    ret_arr = []
    check_str = str.split(" ")
    bigrams.each do |ele_1|
        check_str.each do |ele_0|
            if ele_0.include?(ele_1) && !ret_arr.include?(ele_1)
                ret_arr << ele_1
            end
        end
    end
    ret_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = Hash.new
        if prc == nil
            self.each do |key, val|
                if key == val
                    new_hash[key] = val
                end
            end
            return new_hash
        end
        self.each do |key_0, val_0|
            if prc.call(key_0, val_0) == true
                new_hash[key_0] = val_0
            end
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
            self.each_char.with_index do |ele_0, idx_0|
                self.each_char.with_index do |ele_1, idx_1|
                    if idx_0 < idx_1
                    subs << self[idx_0..idx_1]
                    elsif idx_0 == idx_1
                    subs << self[idx_0]
                    end
                end
            end
            if length == nil
                return subs
            else
                ret_arr = []
                subs.each do |ele|
                    if ele.length == length
                        ret_arr << ele
                    end
                end
            end
        ret_arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        x = 0
        alph = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        ret_str = ""
        self.each_char do |ele|
            x = alph.find_index(ele.downcase)
            x += num
            if x >= alph.length
                ret_str += alph[x % alph.length]
            else
                ret_str += alph[x]
            end
        end
        ret_str
    end
end
