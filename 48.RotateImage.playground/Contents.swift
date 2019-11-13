import UIKit

var str = "Hello, playground"


//Rotating image is basiclly rotating vector
// rx = x * cos(degree) - y * sin(degree)
// ry = x * sin(degree) + y * cos(degree)

func rotateImage(matrix: inout [[Int]]) {
    print(matrix)
    
    guard matrix.count > 1 else { return }
    
    var xCount = matrix[0].count
    var yCount = matrix.count
    
    var x = 0
    var y = 0
    while x < xCount {
        y = 0
        while y < yCount / 2 {
            let temp = matrix[y][x]
            matrix[y][x] = matrix[yCount - y - 1][x]
            matrix[yCount - y - 1][x] = temp
            y += 1
        }
        x += 1
    }
    print(matrix)
    for var y in 0 ..< yCount {
        for var x in y + 1 ..< xCount {
            let temp = matrix[y][x]
            matrix[y][x] = matrix[x][y]
            matrix[x][y] = temp
            x += 1
        }
        y += 1
    }
    
    print(matrix)
}

var temp = [[1,2,3],
            [4,5,6],
            [7,8,9]]
rotateImage(matrix: &temp)
