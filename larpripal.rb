def is_prime?(n)
  i = 2
  while i < n / 2
    return false if n % i == 0
    i += 1
  end
  true
end

def is_palindrome?(n)
  string = n.to_s
  length = string.length
  i = 0
  while i <= length / 2
    return false unless string[i] == string [length - i - 1]
    i += 1
  end
  true
end

def largest_pal_prime_under_1000
  largest_so_far = 2
  next_candidate = largest_so_far
  while next_candidate < 1000
    next_candidate += 1
    next unless is_palindrome?(next_candidate)
    next unless is_prime?(next_candidate)
    largest_so_far = next_candidate
  end
  largest_so_far
end

puts largest_pal_prime_under_1000
