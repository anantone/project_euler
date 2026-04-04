class PentagonNumbers

    attr_accessor :sequence, :pairs

    def initialize(length)
        self.sequence = (1..length).each_with_object([]) do |n, sequence|
            sequence.push(n * (3 * n - 1) / 2)
        end
        self.pairs = self.sequence.combination(2).to_a
    end

    def pentagonal_sums
        self.pairs.select do |pair|
            self.sequence.include?(pair.sum)
        end
    end

    def pentagonal_diffs
        self.pairs.select do |pair|
            self.sequence.include?((pair[1] - pair[0]).abs)
        end
    end

    def pentagonal_sum_and_diff
        pentagonal_sums & pentagonal_diffs
    end

end