//
//  Copyright © 2019 /difway.studio. All rights reserved.
//

import Foundation

class Worker {
    
    func toDo(work: () -> Void, completion: (Bool) -> Void) {
        work()
        completion(true)
    }
}


class Wallpapers {
    
    let name: String
    let patternAlignment: Bool
    
    init(name: String, patternAlignment: Bool) {
        self.name = name
        self.patternAlignment = patternAlignment
    }
}


class WallpaperTask {
    
    let wallpapers: Wallpapers
    let count: Int
    
    init(wallpapers: Wallpapers, count: Int) {
        self.wallpapers = wallpapers
        self.count = count
    }
}


class Office {
    
    func order(tasks: [WallpaperTask], at date: Date, completion: (Double) -> Void) {
        //  some code
    }
}
