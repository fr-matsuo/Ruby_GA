require './GenomBase.rb'

class GenericAlgorithm
    def initialize(genoms)
        @genoms = genoms
    end

    def cycle
        evaluate
        show
    end

    def show
        @genoms.each{|genom|
            genom.show
        }
    end

    def evaluate
        @genoms.each{|genom|
            genom.evaluate
        }
    end
end
