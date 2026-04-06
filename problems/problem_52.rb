class PermutedMultiples

   attr_accessor :result

    def initialize
        a = 1
        until (1..6).all? { |n| (n * a).digits.sort == a.digits.sort }
            a += 1
        end
        self.result = a

    end

end