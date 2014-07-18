class Roulette
    attr_reader :sum

    def initialize (size, offset = 0, pow = 1)
        @size = size
        @roulette = Array.new(size, 0)

        @sum = 0
        for i in 0...@size do
            @roulette[i] = offset + ( i + 1 ) ** pow
            @sum += @roulette[i]
        end
    end

    def calc_index(value = rand(@sum))
        if value < 0 || value >= @sum
            return -1
        end

        width = @sum
        for i in 1..@size do
            idx = @size - i #逆順に(確率が高い方から)走査
            width -= @roulette[idx]
            if value >= width
                return idx
            end
        end

        return -1
    end
end
