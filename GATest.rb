require './GenericAlgorithm.rb'
require './TestGenom.rb'

GENOM_NUM = 20
CROSS_RATE = 0.2
MUTANT_RATE = 0.1

genoms = Array.new(GENOM_NUM, 0)
for i in 0...GENOM_NUM do
    genoms[i] = TestGenom.new(i)
end

ga = GenericAlgorithm.new(genoms, CROSS_RATE, MUTANT_RATE)

while true
    ga.cycle
    sleep(0.25)
end
