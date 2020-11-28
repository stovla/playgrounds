import CreateML
import Foundation

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/vlasrad/Desktop/better-rest.json"))
let (trainingData, testingData) = data.randomSplit(by: 0.8)

let regressor = try MLRegressor(trainingData: trainingData, targetColumn: "actualSleep")

let evaluatonMetrics = regressor.evaluation(on: testingData)
print(evaluatonMetrics.rootMeanSquaredError)
print(evaluatonMetrics.maximumError)

let metadata = MLModelMetadata(author: "Vlastimir Radojevic", shortDescription: "A model trained to predict optimum sleep times for coffee drinkers.", version: "1.0")

try regressor.write(to: URL(fileURLWithPath: "/Users/vlasrad/Desktop/SleepCalculator.mlmodel"), metadata: metadata)
