import UIKit

//Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
//
//Note that the row index starts from 0.
//
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
//Example:
//
//Input: 3
//Output: [1,3,3,1]
//Follow up:
//
//Could you optimize your algorithm to use only O(k) extra space?

class SolutionPascalRecursion {
    
    func getRow(_ rowIndex: Int) -> [Int] {
        
        let startValues : [Int] = [1]
        return getRowRecursion(rowIndex, startValues)
    }
    
    func getRowRecursion(_ rowIndex: Int,_ rowValues: [Int])-> [Int] {
        
        if rowIndex == 0 {
            return rowValues
        }
        var newRow : [Int] = [1]
        
        if rowValues.count == 1
        {
            newRow = [1, 1]
        }
        else
        {
            //Calculate new row and iteration for next row using previous row values
            for i in 0 ..< rowValues.count {
                
                if i == rowValues.count - 1
                {
                    newRow.append(1)
                }
                else {
                    let value : Int = rowValues[i] + rowValues[i + 1]
                    newRow.append(value)
                }
            }
        }

        return getRowRecursion(rowIndex-1, newRow)
    }
}

let objP : SolutionPascalRecursion = SolutionPascalRecursion()
print(objP.getRow(8))
