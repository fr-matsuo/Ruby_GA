class GenomBase
    include Comparable

    attr_reader :evaluation

    def evaluate
        raise 'Called abstract method : GenomBase'
    end

    def show
        puts @evaluation
    end

    def <=>(other)
        - @evaluation <=> - other.evaluation #降順
    end

    def cross(id, other)
        raise 'Called abstract method : GenomBase'
    end

    def mutantion
        raise 'Called abstract method : GenomBase'
    end
end
