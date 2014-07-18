class Roulette
    attr_reader :sum

    def initialize (size, reverse=false, offset = 0, pow = 1)
        @size     = size
        @roulette = Array.new(size, 0)
        @reverse  = reverse

        @sum = 0
        for i in 0...@size do
            @roulette[i] = offset + ( i + 1 ) ** pow
            @sum += @roulette[i]
        end
    end

    def calc_index(value = Random.rand(@sum))
        if value < 0 || value >= @sum
            return -1
        end

        width = @sum
        for i in 1..@size do
            idx = @size - i #逆順に(確率が高い方から)走査
            width -= @roulette[idx]
            if value >= width
                return !@reverse ? idx : @size - idx - 1
            end
        end

        return -1
    end
end
