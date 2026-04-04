require 'prime'

class TruncatablePrimes

    def initialize(number)
        @number = number
        @truncatable_primes = generate_truncatable_primes
        @sum = @truncatable_primes.sum
    end

    def generate_truncatable_primes
        generator = Prime.each
        4.times do generator.next end
        primes = []
        i = generator.next
        while primes.length < @number
            puts i
            j = i.to_s.reverse.to_i
            primes.push(i) if truncatable_prime?(i) && truncatable_prime?(j)
            i = generator.next
        end
        primes
    end

    def truncatable_prime?(number)
        return false unless prime?(number)
        (0...count_digits(number)).each do |i|
            return false unless prime?(number / (10 ** i))
        end
        return true
    end

    def count_digits(number)
        count = 1
        while number / 10 > 0
            count += 1
            number /= 10
        end
        count
    end

    def prime?(number)
      return false if number <= 1
      (2..(number**0.5).to_i).each do |divisor|
        if (number % divisor).zero?
          return false
        end
      end
      true
    end

end