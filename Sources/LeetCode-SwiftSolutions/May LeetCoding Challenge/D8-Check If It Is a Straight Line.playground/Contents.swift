import UIKit
//Check If It Is a Straight Line
//You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.
//
//
//
//
//
//Example 1:
//
//
//
//Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
//Output: true
//Example 2:
//
//
//
//Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
//Output: false
//
//
//Constraints:
//
//2 <= coordinates.length <= 1000
//coordinates[i].length == 2
//-10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
//coordinates contains no duplicate point.
//   Hide Hint #1
//If there're only 2 points, return true.
//   Hide Hint #2
//Check if all other points lie on the line defined by the first 2 points.
//   Hide Hint #3
//Use cross product to check collinearity.


class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        if coordinates.count < 3 {
            return true
        }
        else {
            let firstPoint: [Int] = coordinates[0]
            let secondPoint: [Int] = coordinates[1]
            let xFactor: Double = Double(secondPoint[0] - firstPoint[0])
            let yFactor: Double =  Double(secondPoint[1] - firstPoint[1])
            let coef:  Double = yFactor/xFactor
            print(xFactor, yFactor)
            for point in 2..<coordinates.count {
                let nextPoint: [Int] = coordinates[point]
                let prevPoint: [Int] = coordinates[point-1]
                let currentCoef = (Double(nextPoint[1]) - Double(prevPoint[1])) / (Double(nextPoint[0]) - Double(prevPoint[0]))
                if coef != currentCoef {
                    return false
                }
            }
        }
        return true
    }
}
