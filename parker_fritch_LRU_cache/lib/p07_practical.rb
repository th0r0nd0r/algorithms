require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  chars = string.chars
  hash_map = HashMap.new
  midpoint = nil
  if string.length % 2 != 0
    midpoint = string.length / 2
  end
  chars.each_with_index do |char, i|
    if hash_map.include?(char)
      updated_indices = hash_map[char] << i
      hash_map.set(char, updated_indices)
    else
      hash_map.set(char, [i])
    end
  end

  chars.each do |chr|
    if midpoint
      return false unless (hash_map[chr].length == 2) ||
      hash_map[chr].include?(midpoint)
    else
      return false unless hash_map[chr].length == 2
    end
  end

  true
end
