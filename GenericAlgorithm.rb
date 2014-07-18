require './GenomBase.rb'
require './Roulette.rb'

class GenericAlgorithm
    def initialize(genoms, cross_rate = 0.2, mutant_rate = 0.03, save_elite = true)
        @genoms      = genoms
        @cross_num   = (@genoms.length * cross_rate).ceil
        @mutant_rate = mutant_rate
        @save_elite  = save_elite

        @elite_position = save_elite ? 1 : 0
        @first_roulette = Roulette.new(genoms.length, true)
        @last_roulette  = Roulette.new(genoms.length - @elite_position, false)
    end

    def cycle
        evaluate
        show
        for i in 0...@cross_num do
            cross
        end
        mutantion
    end

    def show
        @genoms[0].show
    end

    def evaluate
        @genoms.each{|genom|
            genom.evaluate
        }
        @genoms.sort!
    end

    def cross
        parent1 = @genoms[@first_roulette.calc_index]
        parent2 = @genoms[@first_roulette.calc_index]

        die_idx = @last_roulette.calc_index + @elite_position

        @genoms[die_idx] = parent1.cross(parent2)
    end

    def mutantion
        for i in @elite_position...@genoms.length do
            if @mutant_rate < rand()
                @genoms[i].mutantion
            end
        end
    end
end
