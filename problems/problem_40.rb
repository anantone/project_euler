class Champernowne

    attr_accessor :constant

    def initialize
        fraction = [1]
        while fraction.length <= 1000000
            fraction.push(fraction[-1]+1)
        end
        self.constant = fraction.join
    end

    def expression
        self.constant[0].to_i * self.constant[9].to_i * self.constant[99].to_i * self.constant[999].to_i * self.constant[9999].to_i * self.constant[99999].to_i * self.constant[999999].to_i
    end
end