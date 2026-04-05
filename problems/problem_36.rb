class DoublePalindromes

    attr_accessor :limit, :doubles

    def initialize limit
        self.limit = limit
        self.doubles = []
        (1..limit).each do |n|
            doubles.push(n) if doublepalindromes?(n)
        end
    end

    def sum
        self.doubles.sum
    end

    def doublepalindromes?(number)
        palindrome?(number) && palindrome?(to_binary(number))
    end

    def palindrome?(number)
        number.to_s == number.to_s.reverse
    end

    def to_binary(n)
        return "0" if n == 0

        negative = n < 0
        n = n.abs
        bits = []
        while n > 0
            bits.unshift(n % 2)
            n /= 2
        end

        result = bits.join
        negative ? "-#{result}" : result
    end

end
