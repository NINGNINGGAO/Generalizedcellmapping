function ParameterSettingAssertionFunction(dimension, largeCellSize, smallCellSize, stateSpace,...
    monteCarloSimulationTimes, time, noiseIntensity, h, oneStepMappingSize)
assert(dimension > 0,"The value of ""dimension"" must be consistent with the dimension of the equation and greater than zero!!!");
assrt(largeCellSize == dimension, "The value of ""largeCellSize"" must be consistent with ""dimension""!!!");
assrt(smallCellSize == dimension, "The value of ""smallCellSize"" must be consistent with ""dimension""!!!");
assrt(stateSpace == dimension, "The value of 'statespace' must be twice of 'dimension', and each dimension in the state space should have a maximum and minimum value!!!");
for i = 1 : dimension
    assert(stateSpace[2 * i - 1] < stateSpace[2 * i], "The minimum value of each dimension should be less than the maximum value!!!");
end
assert(monteCarloSimulationTimes > 0, "The value of ""Montecarlo simulation times"" should be greater than zero!!!");
assert(time > 0, "The value of ""time"" should be greater than zero!!!");
assert(noiseIntensity >= 0, "The value of ""time"" should be greater than or equal to zero!!!");
assert(h > 0, "The value of ""h"" should be greater than zero!!!");
assert(oneStepMappingSize > 0, "The value of ""oneStepMappingSize"" should be greater than zero!!!");
assert((noiseIntensity == 0 && monteCarloSimulationTimes == 1), "The number of Monte Carlo simulation of deterministic differential equation is set to one!!!");
end
