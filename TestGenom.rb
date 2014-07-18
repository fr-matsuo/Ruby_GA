require './GenomBase'

class TestGenom < GenomBase
    LENGTH = 100

    attr_reader :genom

    def initialize(id, genom = nil)
        @id = id
        if genom == nil
            @genom = Array.new(LENGTH ,0)
            for i in 0...LENGTH do
                @genom[i] = Random.rand(2)
            end
        else
            @genom = genom
        end
    end

    def evaluate
        #前の値と同じなら、それまで連続していた数だけ評価を足す
        @evaluation = 0
        value = @genom[0]
        continues = 0
        for i in 1...LENGTH
            if @genom[i] == value
                continues += 1
                @evaluation += continues
            else
                continues = 0
                value = @genom[i]
            end
        end
    end

    def show
        for v in @genom
            print v
        end
        puts
        puts 'ID:' + @id.to_s + "\tevaluation:" + @evaluation.to_s
    end
    
    def cross(index, other)
        #二点交叉
        genom = Array.new(LENGTH, 0)

        start_index = Random.rand(0...LENGTH)
        end_index   = Random.rand(1..LENGTH)
        if start_index > end_index
            buf         = start_index
            start_index = end_index
            end_index   = buf
        end

        for i in 0...start_index do
            genom[i] = @genom[i]
        end
        for i in start_index...end_index do
            genom[i] = other.genom[i]
        end
        for i in end_index...LENGTH do
            genom[i] = @genom[i]
        end

        return TestGenom.new(index, genom)
    end

    def mutantion
        genom[Random.rand(LENGTH)] = Random.rand(2)
    end
end
