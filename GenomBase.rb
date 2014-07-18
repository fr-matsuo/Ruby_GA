class GenomBase
    include Comparable

    def evaluate
        @evaluate = rand(100);
    end

    def show
        puts @evaluate
    end
end
