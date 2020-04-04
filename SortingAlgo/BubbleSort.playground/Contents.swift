import UIKit
//Bubble Sort
//Bubble sort is a sorting algorithm that is implemented by starting in the beginning of the array and swapping the first two elements only if the first element is greater than the second element. This comparison is then moved onto the next pair and so on and so forth. This is done until the array is completely sorted. The smaller items slowly “bubble” up to the beginning of the array. Sometimes this algorithm is refered as Sinking sort, due to the larger, or heavier elements sinking to the end of the array.
//
//Runtime:
//Average: O(N^2)
//Worst: O(N^2)
//Memory:
//O(1)
//Implementation:
//The implementation will not be shown as the average and worst runtimes show that this is a very inefficient algorithm. However, having a grasp of the concept will help you understand the basics of simple sorting algorithms.
//
//Bubble sort is a very simple sorting algorithm, it consists in comparing pairs of adjacent elements in the array, if the first element is larger, swap them, otherwise, you do nothing and go for the next comparison. This is accomplished by looking through the array n times, n being the amount of elements in the array.

class Solution {
    func bubbleSort<T : Comparable>(_ unsortedArray: [T]) -> [T] {
        var resultArray : [T] = unsortedArray
       
        for i in 0..<resultArray.count {
            for j in 1..<resultArray.count - i { // Optimesd by added -i to reduce the comparisons
                
                if resultArray[j] < resultArray[j-1]
                {
                    let temp = resultArray[j-1]
                    resultArray[j-1] = resultArray[j]
                    resultArray[j] = temp
                }
            }
        }
        return resultArray
    }
}

var sol : Solution = Solution()
print(sol.bubbleSort([-2, 1, 8, 3, 4, 17, 13]))
