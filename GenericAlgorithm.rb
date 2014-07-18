require './GenomBase.rb'

class GenericAlgorithm
    def initialize(genoms)
        @genoms = genoms
    end

    def evaluate
        @genoms.each{|genom|
            genom.evaluate
        }
    end
end
