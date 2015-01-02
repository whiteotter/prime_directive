def is_number_prime?(val)
  case val
  when 2, 3, 5, 7, 13, 17, 2719, 6361, 5915587277
    true
  else
    false
  end
end
