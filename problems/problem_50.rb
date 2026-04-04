require 'prime'

def primes_as_sum_of_consecutive_primes(limit)
  primes = Prime.each(limit).to_a
  results = []
  
  # Try different starting positions and lengths
  primes.each_index do |start|
    sum = 0
    (start...primes.length).each do |finish|
      sum += primes[finish]
      break if sum > limit
      
      # Check if sum is prime and uses at least 2 consecutive primes
      if finish > start && Prime.prime?(sum)
        results << {
          prime: sum,
          components: primes[start..finish],
          count: finish - start + 1
        }
      end
    end
  end
  
  results.uniq { |r| r[:prime] }.sort_by { |r| r[:prime] }
end