import UIKit

//5388. Reformat The String
//User Accepted:23
//User Tried:40
//Total Accepted:23
//Total Submissions:42
//Difficulty:Easy
//Given alphanumeric string s. (Alphanumeric string is a string consisting of lowercase English letters and digits).
//
//You have to find a permutation of the string where no letter is followed by another letter and no digit is followed by another digit. That is, no two adjacent characters have the same type.
//
//Return the reformatted string or return an empty string if it is impossible to reformat the string.
//
//
//
//Example 1:
//
//Input: s = "a0b1c2"
//Output: "0a1b2c"
//Explanation: No two adjacent characters have the same type in "0a1b2c". "a0b1c2", "0a1b2c", "0c2a1b" are also valid permutations.
//Example 2:
//
//Input: s = "leetcode"
//Output: ""
//Explanation: "leetcode" has only characters so we cannot separate them by digits.
//Example 3:
//
//Input: s = "1229857369"
//Output: ""
//Explanation: "1229857369" has only digits so we cannot separate them by characters.
//Example 4:
//
//Input: s = "covid2019"
//Output: "c2o0v1i9d"
//Example 5:
//
//Input: s = "ab123"
//Output: "1a2b3"
//
//
//Constraints:
//
//1 <= s.length <= 500
//s consists of only lowercase English letters and/or digits.

//5390. Minimum Number of Frogs Croaking
//User Accepted:0
//User Tried:0
//Total Accepted:0
//Total Submissions:0
//Difficulty:Medium
//Given the string croakOfFrogs, which represents a combination of the string "croak" from different frogs, that is, multiple frogs can croak at the same time, so multiple “croak” are mixed. Return the minimum number of different frogs to finish all the croak in the given string.
//
//A valid "croak" means a frog is printing 5 letters ‘c’, ’r’, ’o’, ’a’, ’k’ sequentially. The frogs have to print all five letters to finish a croak. If the given string is not a combination of valid "croak" return -1.
//
//
//
//Example 1:
//
//Input: croakOfFrogs = "croakcroak"
//Output: 1
//Explanation: One frog yelling "croak" twice.
//Example 2:
//
//Input: croakOfFrogs = "crcoakroak"
//Output: 2
//Explanation: The minimum number of frogs is two.
//The first frog could yell "crcoakroak".
//The second frog could yell later "crcoakroak".
//Example 3:
//
//Input: croakOfFrogs = "croakcrook"
//Output: -1
//Explanation: The given string is an invalid combination of "croak" from different frogs.
//Example 4:
//
//Input: croakOfFrogs = "croakcroa"
//Output: -1
//
//
//Constraints:
//
//1 <= croakOfFrogs.length <= 10^5
//All characters in the string are: 'c', 'r', 'o', 'a' or 'k'.

//5389. Display Table of Food Orders in a Restaurant
//User Accepted:3643
//User Tried:3883
//Total Accepted:3677
//Total Submissions:6036
//Difficulty:Medium
//Given the array orders, which represents the orders that customers have done in a restaurant. More specifically orders[i]=[customerNamei,tableNumberi,foodItemi] where customerNamei is the name of the customer, tableNumberi is the table customer sit at, and foodItemi is the item customer orders.
//
//Return the restaurant's “display table”. The “display table” is a table whose row entries denote how many of each food item each table ordered. The first column is the table number and the remaining columns correspond to each food item in alphabetical order. The first row should be a header whose first column is “Table”, followed by the names of the food items. Note that the customer names are not part of the table. Additionally, the rows should be sorted in numerically increasing order.
//
//
//
//Example 1:
//
//Input: orders = [["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]]
//Output: [["Table","Beef Burrito","Ceviche","Fried Chicken","Water"],["3","0","2","1","0"],["5","0","1","0","1"],["10","1","0","0","0"]]
//Explanation:
//The displaying table looks like:
//Table,Beef Burrito,Ceviche,Fried Chicken,Water
//3    ,0           ,2      ,1            ,0
//5    ,0           ,1      ,0            ,1
//10   ,1           ,0      ,0            ,0
//For the table 3: David orders "Ceviche" and "Fried Chicken", and Rous orders "Ceviche".
//For the table 5: Carla orders "Water" and "Ceviche".
//For the table 10: Corina orders "Beef Burrito".
//Example 2:
//
//Input: orders = [["James","12","Fried Chicken"],["Ratesh","12","Fried Chicken"],["Amadeus","12","Fried Chicken"],["Adam","1","Canadian Waffles"],["Brianna","1","Canadian Waffles"]]
//Output: [["Table","Canadian Waffles","Fried Chicken"],["1","2","0"],["12","0","3"]]
//Explanation:
//For the table 1: Adam and Brianna order "Canadian Waffles".
//For the table 12: James, Ratesh and Amadeus order "Fried Chicken".
//Example 3:
//
//Input: orders = [["Laura","2","Bean Burrito"],["Jhon","2","Beef Burrito"],["Melissa","2","Soda"]]
//Output: [["Table","Bean Burrito","Beef Burrito","Soda"],["2","1","1","1"]]
//
//
//Constraints:
//
//1 <= orders.length <= 5 * 10^4
//orders[i].length == 3
//1 <= customerNamei.length, foodItemi.length <= 20
//customerNamei and foodItemi consist of lowercase and uppercase English letters and the space character.
//tableNumberi is a valid integer between 1 and 500.


//5391. Build Array Where You Can Find The Maximum Exactly K Comparisons
//User Accepted:0
//User Tried:0
//Total Accepted:0
//Total Submissions:0
//Difficulty:Hard
//Given three integers n, m and k. Consider the following algorithm to find the maximum element of an array of positive integers:
//
//
//You should build the array arr which has the following properties:
//
//arr has exactly n integers.
//1 <= arr[i] <= m where (0 <= i < n).
//After applying the mentioned algorithm to arr, the value search_cost is equal to k.
//Return the number of ways to build the array arr under the mentioned conditions. As the answer may grow large, the answer must be computed modulo 10^9 + 7.
//
// 
//
//Example 1:
//
//Input: n = 2, m = 3, k = 1
//Output: 6
//Explanation: The possible arrays are [1, 1], [2, 1], [2, 2], [3, 1], [3, 2] [3, 3]
//Example 2:
//
//Input: n = 5, m = 2, k = 3
//Output: 0
//Explanation: There are no possible arrays that satisify the mentioned conditions.
//Example 3:
//
//Input: n = 9, m = 1, k = 1
//Output: 1
//Explanation: The only possible array is [1, 1, 1, 1, 1, 1, 1, 1, 1]
//Example 4:
//
//Input: n = 50, m = 100, k = 25
//Output: 34549172
//Explanation: Don't forget to compute the answer modulo 1000000007
//Example 5:
//
//Input: n = 37, m = 17, k = 7
//Output: 418930126
// 
//
//Constraints:
//
//1 <= n <= 50
//1 <= m <= 100
//0 <= k <= n
class Solution {
    func reformat(_ s: String) -> String {
        let arr : [String] = s.map{String($0)}
        var numArr : [String] = []
        var strArr : [String] = []
        for i in arr {
            if Int(i) != nil {
                numArr.append(i)
            }
            else {
                strArr.append(i)
            }
        }
        var str = ""
        let diff = strArr.count - numArr.count
        if diff > 0 && diff < 2 {
            for j in 0..<numArr.count{
                str = "\(str)\(strArr[j])\(numArr[j])"
            }
            str = "\(str)\(strArr[strArr.count-1])"
        }
        else if diff > -2 && diff < 0 {
            for i in 0..<strArr.count {
                str = "\(str)\(numArr[i])\(strArr[i])"
            }
            str = "\(str)\(numArr[numArr.count-1])"
        }
        else if diff  == 0 {
            for j in 0..<strArr.count{
                str = "\(str)\(strArr[j])\(numArr[j])"
            }
        }
        return str
    }
    
    func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
        let croakArr : [String] = ["c", "r", "o", "a", "k"]
        let arr : [String] = croakOfFrogs.map{String($0)}
        var countArray : [[String]] = []
        var check : Bool = false
         print(countArray)
        var cr : [String] = []
        for i in 0..<arr.count {
            for j in 0..<croakArr.count {
                if i == 0 && j == 0 {
                    if arr[i] == croakArr[j] {
                        cr.append(arr[i])
                        countArray.append(cr)
                        print(countArray)
                    }
                }
                else if i == j && i != 0 {
                    if arr[i] == croakArr[j] {
                        cr.append(arr[i])
                        countArray[countArray.count-1] = cr
                        print(countArray)
                    }
                    else {
                        print(i,j)
                        if arr[i] == croakArr[0] {
                            cr = []
                            cr.append(arr[i])
                            countArray.append(cr)
                            print(countArray)
                        }
                        else  {
                            print("next", arr[i])
                        }
                        
                    }
                }
                else  {
                    //print("else", arr[i])
                }
                
            }
        }
        return countArray.count > 0 ? countArray.count : -1
    }
    
    func displayTable(_ orders: [[String]]) -> [[String]] {
        var userName : [String] = []
        var table : [Int] = []
        var food : [String] = []
        
        for i in 0..<orders.count {
            for j in 0..<orders[0].count {
                if j == 0 {
                    userName.append(orders[i][j])
                }
                else if j == 1 {
                    table.append(Int(orders[i][j]) ?? 0)
                }
                else if j == 2 {
                    food.append(orders[i][j])
                }
            }
        }
        
        print(userName)
        print(table)
        print(food)
        
        var quantityArray : Set<String> = []
        var foodArray : Set<String> = []
        table = table.sorted()
        print("table", table)
        for q in table {
            quantityArray.insert(String(q))
        }
        for f in food {
            foodArray.insert(f)
        }
        
        var tableFood : [String] = []
        tableFood.append("Table")
        for f in foodArray {
            tableFood.append(f)
        }
        
        print(quantityArray)
        print(tableFood)
        
        var quantityFoodOut = [tableFood]
        for i in quantityArray {
            var quantityFood :  [String] = []
            quantityFood.append(i)
            for j in foodArray {
                print(j)
                var count = 0
                for k in 0..<food.count {
                    if i == String(table[k]) && food[k] == j {
                        count += 1
                    }
                }
                quantityFood.append(String(count))
            }
            quantityFoodOut.append(quantityFood)
        }
        
        return quantityFoodOut
    }
}

let sol = Solution()
//print(sol.reformat("covid201"))
//print(sol.minNumberOfFrogs("crcoakroak"))
print(sol.displayTable([["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]]))

[["Table","Beef Burrito","Ceviche","Fried Chicken","Water"],["3","0","2","1","0"],["5","0","1","0","1"],["10","1","0","0","0"]]

[["Table", "Fried Chicken", "Water", "Beef Burrito", "Ceviche"], ["5", "1", "0", "0", "1", "1", "1", "10", "0", "1", "0", "0", "0", "0", "3", "2", "0", "1", "0", "2", "2"]]
[["Table","Beef Burrito","Ceviche","Fried Chicken","Water"],["5","0","1","0","1"],["3","0","2","1","0"],["10","1","0","0","0"]]
[["Table","Beef Burrito","Ceviche","Fried Chicken","Water"],["3","0","2","1","0"],["5","0","1","0","1"],["10","1","0","0","0"]]
