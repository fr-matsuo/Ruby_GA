require './GenomBase.rb'
require './Roulette.rb'

class GenericAlgorithm
    def initialize(genoms)
        @genoms = genoms
        @roulette = Roulette.new(genoms.length)
    end

    def cycle
        evaluate
        show
        cross
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
        @genoms.sort!
    end

    def cross
        parent1 = @genoms[@genoms.length - @roulette.calc_index - 1]
        parent2 = @genoms[@genoms.length - @roulette.calc_index - 1]

        die_idx = @roulette.calc_index

        @genoms[die_idx] = parent1.cross(parent2)
    end

    def mutantion
        @genoms[@roulette.calc_index].mutantion
    end
end
