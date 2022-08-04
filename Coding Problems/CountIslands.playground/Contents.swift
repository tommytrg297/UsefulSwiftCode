import Foundation

// Matrix array of size m*n
// Time : O (m*n) for loop
// Space :
func countIslands (_ grid : [[String]]) -> Int {
    var result = 0
    var matrix = grid
    for i in 0..<matrix.count {
        let row = matrix[i]
        for j in 0..<row.count {
            let value = matrix[i][j]
            if value == "1" {
                result += 1
                //depth first search (DFS)
                search(i, j, &matrix)
            }
        }
    }
    return result
}

func search(_ row : Int, _ col : Int, _ grid : inout [[String]]) {
    // verify base case
    guard row >= 0, col >= 0 ,row < grid.count, col < grid[0].count else {
        return
    }
    // update value to  0
    guard grid[row][col] == "1" else { return }
    grid[row][col] == "0"
    search(row+1, col, &grid)
    search(row-1, col, &grid)
    search(row, col+1, &grid)
    search(row, col-1, &grid)


    
    // search neighbors
}

let grid = [["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]]

let result = countIslands(grid)
print(result)
