import UIKit


class Graph {
    var adj = [[Bool]] ( init with false)
    var count: Int = 0
    
    var visited = [[Bool]](false)
    
    
    func putLand(x, y) {
        
        adj[x][y] = true
        count = 0
        
        for var i ..< adj.count {
            for var j .. < adj[i].count {
                
                if cell is not visited
                if cell is occupied {
                     BFT(i,j) {
                        count += 1
                    }
                }
            }
        }
    }
    
    
    func BFT(x, y) -> Bool{
        let land = adj[x][y]
        
        adjs of land
        
        
    }
    
    
    
    
}
