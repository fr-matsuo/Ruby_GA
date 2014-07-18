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
        puts 'mine :'+@evaluation.to_s
        puts 'other:'+other.evaluation.to_s
        -@evaluation <=> -other.evaluation
    end
end
