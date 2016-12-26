def is_prime?(n)
  return false if n == 1
  for i in (2..(n / 2))
    return false if n % i == 0
  end
  true
end

primes_added = 0
sum_so_far = 0
next_number = 1
while primes_added < 1000
  if is_prime?(next_number)
    sum_so_far += next_number
    primes_added += 1
  end
  next_number += 1
end

puts sum_so_far
