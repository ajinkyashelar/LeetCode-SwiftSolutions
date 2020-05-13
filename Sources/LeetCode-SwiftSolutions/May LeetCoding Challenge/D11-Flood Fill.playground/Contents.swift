import UIKit

//Flood Fill
//An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
//
//Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
//
//To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
//
//At the end, return the modified image.
//
//Example 1:
//Input:
//image = [[1,1,1],[1,1,0],[1,0,1]]
//sr = 1, sc = 1, newColor = 2
//Output: [[2,2,2],[2,2,0],[2,0,1]]
//Explanation:
//From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
//by a path of the same color as the starting pixel are colored with the new color.
//Note the bottom corner is not colored 2, because it is not 4-directionally connected
//to the starting pixel.
//Note:
//
//The length of image and image[0] will be in the range [1, 50].
//The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
//The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
//   Hide Hint #1
//Write a recursive function that paints the pixel if it's the correct color, then recurses on neighboring pixels.

// 60 ms
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if image[sr][sc] == newColor { return image } // If the new color is same as start pixel we don't need to do any thing.
        var image = image
        //Use recursive function with call by reference to image 2d array to fill color and check top, left, right & bottom neigbours.
        floodFillColor(&image, sr, sc, newColor, image[sr][sc]) //send the color to be changed. (image[sr][sc])
        return image
    }
    
    func floodFillColor(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ changeColor: Int) {
        // print(image)
        // print(sr, sc)
        // Check with OR ||  if we don't go out of bounds of the 2D array while recursive calls.
        // Check if the point to fill is already filled with changeColor
        if sr < 0 || sc < 0 || sc >= image[0].count || sr >=  image.count || image[sr][sc] != changeColor {
            return
        }
        image[sr][sc] = newColor
        // left
        floodFillColor(&image, sr, sc-1, newColor, changeColor)
        // right
        floodFillColor(&image, sr, sc+1, newColor, changeColor)
        // top
        floodFillColor(&image, sr-1, sc, newColor, changeColor)
        // bottom
        floodFillColor(&image, sr+1, sc, newColor, changeColor)
    }
}

// 160 ms
class Solution160ms {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {

       let image = floodFillColor(image, sr, sc, newColor, image[sr][sc])

        return image
    }

    func floodFillColor(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ changeColor: Int) -> [[Int]] {

        print(image)
        print(sr, sc)
        if sr < 0 || sc < 0 || sc >= image[0].count || sr >=  image.count  {
            print("out")
            print(sr, sc)
            return image
        }
        if image[sr][sc] == newColor {
            return image
        }
        var image = image
        if image[sr][sc] == changeColor {
            image[sr][sc] = newColor
        }
        else {
            return image
        }
        // left
        print("left")
        image = floodFillColor(image, sr, sc-1, newColor, changeColor)

        // right
        print("right")
        image = floodFillColor(image, sr, sc+1, newColor, changeColor)

        // top
        print("top")
        image = floodFillColor(image, sr-1, sc, newColor, changeColor)

        // bottom
        print("bottom")
        image = floodFillColor(image, sr+1, sc, newColor, changeColor)


        return image
    }

}
