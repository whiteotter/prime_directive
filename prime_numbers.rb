require 'set'

def is_number_prime?(num)
  find_factors(num, prime_search: true)
end

def find_factors(num, params={})
  start = params[:start] || 2
  prime_search = params[:prime_search] || false
  stored_primes = params[:stored_primes] || get_primes_list

  if stored_primes.include?(num)
    return true if prime_search
    puts "prime found in list -- #{num}"
    return [num] 
  elsif found_composite = composite_search(start, num)
    return false if prime_search
    factor_memo ||= Hash.new
    remainder = num / found_composite
    factor_memo[found_composite] ||= find_factors(found_composite, start: found_composite, stored_primes: stored_primes)
    factor_memo[remainder] ||= find_factors(remainder, start: found_composite, stored_primes: stored_primes)
    factor_memo[found_composite] + factor_memo[remainder]
  else
    prime_in_list = stored_primes.include?(num)
    puts "prime found in list -- #{num}" if prime_in_list
    add_prime_to_list(num, stored_primes) unless prime_in_list
    return true if prime_search
    return [num]
  end
end

def get_primes_list
  Marshal.load(File.open('stored_primes.dat', 'r')) rescue Set.new
end

def add_prime_to_list(num, list)
  puts "storing prime to list -- #{num}"
  list << num
  File.open('stored_primes.dat', 'w') { |f| f.write Marshal.dump(list) }
end

def composite_search(start_num, num)
  if (start_num..num).size > 10_000_000_000
    puts "composite search range is too long (over 10 billion)"
    exit
  end
  start_num.upto(num/2) do |i|
    return i if num % i == 0
  end
  false
end

puts "enter a number to get the prime factors"
while input = gets.chomp do
  input = input.gsub(',','').to_i
  if input > 0
    puts find_factors(input).uniq.inspect
  else
    break
  end
  puts
end
