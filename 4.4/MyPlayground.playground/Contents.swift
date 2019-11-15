//struct Circle {
//    var coordinates: (x: Int, y: Int)
//    var radius: Float
//    var perimeter: Float {
//        get {
//            return 2 * 3.1415 * self.radius
//        }
//        set (blabalabla) {
//            self.radius = blabalabla / (2 * 3.1415 )
//            blabla()
//        }
//    }
//
//    func blabla() {
//        print("blablabla")
//    }
//}
//
//var newCircle = Circle(coordinates: (0, 0), radius: 30)
//newCircle.coordinates
//newCircle.perimeter
//newCircle.radius
//
//newCircle.perimeter = 150
//newCircle.radius

//struct Table {
//    var list: [String] {
//        didSet {
//            self.countCell = self.list.count
//        }
//    }
//
//    var countCell: Int = 0
//}
//
//var table = Table(list: [])
//table.list = ["asjfh", "asjkfh", "sakjfh"]
//table.countCell

class Chessman {
    typealias Coordinates = (String, Int)
    
    enum ChessmanColor {
        case white
        case black
    }
    
    enum ChessmanType {
        case king
        case hours
    }

    var type: ChessmanType
    var color: ChessmanColor
    var coordinates: Coordinates?
    
    init(type: ChessmanType, color: ChessmanColor) {
        self.color = color
        self.type = type
    }
    
    func getCoordinates() -> Coordinates? {
        return coordinates
    }
}

var kingWhite = Chessman(type: .king, color: .white)
kingWhite.coordinates = ("A", 13)

kingWhite.getCoordinates()

