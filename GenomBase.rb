class GenomBase
    include Comparable

    attr_reader :evaluation

    def evaluate
        @evaluation = rand(100);
    end

    def show
        puts @evaluation
    end

    def <=>(other)
        - @evaluation <=> - other.evaluation #降順
    end

    def cross(other)
        raise 'Called abstract method : GenomBase'
    end
end
