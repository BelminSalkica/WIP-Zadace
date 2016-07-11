// >>>>>>>> Control Flow | Functions | Closures | Enumerations <<<<<<<<< //

// Flow control
// Loops / for in / while / repeat while 
// Brenching / if / guard / switch 
// Transfer control  / break / continue / fall trough 

// Loops
// For in loop

for index in 1...5 {
    print("\(index) times 5 is = \(index * 5)")
}

for _ in 1...10 {
    print("This should be executed 10 times")
}

var answer = 1
let base = 3
let power = 10

for _ in 1...power {
    answer *= base
}
print("Base \(base) to power of \(power) is: \(answer)")

let names = ["Belmin", "Benjamin", "Asmir", "Ahmed"]
for name in names {
    print("Hello \(name)")
}

var numOfLegs = ["Pauk": 8, "Mrav": 4, "Maca": 4, "Konj": 4]
for (name, num) in numOfLegs {
    print("\(name) have \(num) legs")
}
let arrayOfNums = [1,3,4,5,11,44,323,43,54,24,14]
for i in arrayOfNums {
    print("\(i) * 2 = \(i * 2)")
}

let footballClubs = ["Barcelona", "Real Madrid", "Chelsea", "Machester city", "Manchester united"]
var favouriteClub = "My favourite football club is: "

footballClubs.count
footballClubs.endIndex

for i in 0..<footballClubs.count {
    
    favouriteClub += "\(footballClubs[i])"
    
    if i < (footballClubs.count - 1) { 
        favouriteClub += " ,"
    }
}

print(favouriteClub)

//  While loops //

var age = 1
while age < 10 {
    print("Age is: \(age)")
    age += 1
}
var someNum = 1
var count = 0
while someNum < 10_000 {
    count += 1
    someNum *= 2
    print(someNum)
}
count = 0
var numb = [1,2,3,4,5,6]
while numb.isEmpty == false {
    count += 1
    print("\(numb.removeAtIndex(0)) is out")
    if numb.isEmpty == true {
        print("It took \(count) to empty this collection of int's")
    }
}
var brojevi = [1,3,4,5,6,7,8,98,56,74,21,41,24,2,12,44]
var parni = [Int]()
var neparni = [Int]()

while brojevi.isEmpty == false {
    var trenutniBroj = brojevi.removeAtIndex(0)
    if trenutniBroj % 2 == 0 {
        parni.append(trenutniBroj)
        print("Parni brojevi: \(parni)")
    } else {
        neparni.append(trenutniBroj)
        print("Neparni brojevi: \(neparni)")
        
    }
    
}
print("Imamo \(parni.count) parnih brojeva i \(neparni.count) neparnih")

//  Repeat while  //

age = 1
repeat {
    print("Age is: \(age)")
    age += 1
} while age < 10

print("It took \(count) to get to 10,000")

// Snake game //

let finalScore = 25
var board = [Int](count: finalScore + 1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

//while square < finalScore {
//    diceRoll += 1
//    if diceRoll == 7 { diceRoll = 1 }
//    square += diceRoll
//    if square < board.count {
//        square += board[square]
//    }
//}
//print("Game over")

repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
} while square < finalScore
print("Game over!")

var brojac = 0
repeat {
    brojac += 1
    print(brojac)
} while brojac < 10

// If statements // If, else if, else

var bool = true

if bool == true {
    print("This if statement is true")
}


var arrayOfCharacters: [Character] = ["A", "B", "C", "D", "E"] // Array
var setOfStrings: Set = ["Belmin", "Rijo", "Ahmed", "Amer"] // Set
var dictionary: [String: String] = ["Tr": "Travnik", "Ze": "Zenica", "Sa": "Sarajevo", "Do": "Doboj"] //Dictionary

var counter = 0

if arrayOfCharacters.count > setOfStrings.count {
    if arrayOfCharacters.contains("A") {
        for i in 1..<arrayOfCharacters.count {
            print("Character \(i) is: \(arrayOfCharacters[i])", terminator:".")
        }
        if arrayOfCharacters.count <= 5 {
            print("Arrays of characters contains: \(arrayOfCharacters.count) characters")
            let charToString = String(arrayOfCharacters)
            print("Array of characters now is string: \(charToString)")
        }
    }
}

while setOfStrings.isEmpty == false {
    if setOfStrings.contains("Belmin") {
        for index in setOfStrings {
            print("Set name: \(index)")
            print("Set contains \(setOfStrings.count) elements")
        }
    }
    setOfStrings.removeAll()
}
    if dictionary.isEmpty == false {
        for (key, name) in dictionary {
            print("Dictionary key: \(key) | Dictionary name \(name)")
            let removeWithKey = dictionary.removeValueForKey(key)
            print("Dictionary: \(removeWithKey)")
        }
        
    }


//  Switch statement //

let weekDictionary: [Int: String] = [1: "Ponedeljak", 2: "Utorak", 3: "Srijeda", 4: "Cetvrtak", 5: "Petak", 6: "Subota" , 7: "Nedelja"]
var today = String!(weekDictionary[2]) // We use String! because weekDictionary returns Optional value

switch today {
    case "Ponedeljak":
        print("Danas je \(today)")
    case "Utorak":
        print("Danas je \(today)")
    case "Srijeda":
        print("Danas je \(today))")
    case "Cetvrtak":
        print("Danas je \(today))")
    case "Petak":
        print("Danas je \(today)")
    case "Subota":
        print("Danas je \(today)")
    case "Nedelja":
        print("Danas je \(today)")
    default:
        print("This is just a default message")
    
}

let ageB = 21

switch ageB {
case 1..<18:
    print("Teen")
default:
    print("Adult")
}

let theVar = 4
var someString = String()
let dummyText = "The answer: "

switch theVar {
case 0:
    someString = "How"
case 1...4:
    someString = "Yes"
case 5...20:
    someString = "No"
default:
    someString = "Default"
}

print("\(dummyText) \(someString)")

// Switch statement with tuples //

let theNum = (1, 1)
switch theNum {
case (0, 0):
    print("0,0 is at origin")
case (_, 0):
    print("(\(theNum.0),0) is on the x axis")
case (0, _):
    print("0,\(theNum.1) is on the y axis")
case (-2...2, -2...2):
    print("\(theNum.0), \(theNum.1) is inside of the box")
default:
    print("\(theNum.0) and \(theNum.1) are out of the box!")
}


let somePoint = (0,4)

switch somePoint {
case (let x, 0):
    print("Some point is ond the x axis with x = \(x)")
case (0, let y):
    print("Some point is on the y axis with y = \(y)")
case let (x, y):
    ("Somewhere else at: x = \(x) y = \(y)")
}

// Default case isn't required because final case matches all remaining values //

let newPoint = (1,-1)
switch newPoint {
case let(x, y) where x == y:
    print("x = \(x), y = \(y) is on x == y")
case let (x ,y) where x == -y:
    print("x = \(x), y = \(y) is on x == -y")
case let (x, y):
    print("This is some point with x = \(x) and y = \(y)")
}

// Control transfer statements //

// Continue //

let string = "Belmin Salkica"
var stringWithoutVowels = ""
for character in string.characters {
    switch character {
    case "a", "i", "e", "o", "u":
        continue // Continue tells loop to stop what it's doing and start again
    default:
        stringWithoutVowels.append(character)
    }
}
print(stringWithoutVowels)

// Break //
var newArray = [1, 3, 4, 5, -15, 16]
for num in newArray {
    if num > 0 {
        print(num)
    } else {
        break // code will run until num > 0
    }
}
// fallthrough //
var someInt = 5
var someIntToDescribe = "Number \(someInt) is "
switch someInt {
case 1,2,3,4,5,6,7,8:
    someIntToDescribe += " a prime num and also"
    fallthrough // Fallthrough fall through the bottom of each case and into the next one
default:
    someIntToDescribe += " an integer"
}
// Guard //

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
}
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope weather is nice near you!")
        return
    }
    print("I hope weather is nice at \(location)")

}
greet(["name": "Belmin"])
greet(["name": "Belmin", "location": "Travnik"])

let ages = [11,18,19,22,44]
for age in ages {
    guard age > 18 else {
        print("Teen")
        break
    }
    print("He is an adult")
}


// Functions //

func helloWorld() {
    print("Hello World")
}
helloWorld()

func sayHelloTo(personName: String) -> String{
    let greeting = "Hello " + personName + "!"
    return greeting
}
print(sayHelloTo("Belmin"))

func add(a: Int, b: Int) -> Int {
    return a + b
}
add(2,b: 4)

func sayHello(greeting: String, to: String) {
    print("\(greeting) \(to)")
}
sayHello("Pozdrav", to: "Belmin")

func sayHelloAgain(personName: String) -> String {
    return "Hello again, " + personName + "!"
}



func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloTo(personName)
    } else {
        return sayHelloAgain(personName)
    }
}
print(sayHello("Belmin", alreadyGreeted: true))

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var newMin = array[0]
    var newMax = array[0]
    for i in array[1..<array.count] {
        if i < newMin {
            newMin = i
        } else if i > newMax {
            newMax = i
        }
    }
    return(newMin, newMax)
}

let theArray = minMax([1,2,3,4,5,6,11,123,1234,-1,-2,-33])
print("Min value is: \(theArray.min) and max is: \(theArray.max)")


func optMinMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var newMax = array[0]
    var newMin = array[0]
    for index in array[1..<array.count] {
        if index > newMax {
            newMax = index
        } else if index < newMin {
            newMin = index
        }
    }
    return(newMin, newMax)
}

if let optArry = optMinMax([Int]()) {
    print(optArry)
}

// Function external parameter name //

func pozdrav(to name: String, and secondName: String) -> String {
    return "Hello \(name) and \(secondName)"
}
pozdrav(to: "Belmin", and: "Ahmed")

func average(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
average(1,2,3,4,5,6,7,8,9)

// In out parameters //

func swap(inout a: Int, inout b: Int) {
    let oldA = a
    a = b
    b = oldA
}

var randomInt = 4
var this = 7
swap(&randomInt, &this) // We are accesing var declared outside of function with &varName
print("randomInt = \(randomInt) this = \(this)")


// Function as type 

func saberi(a: Int, _ b: Int) -> Int{
    return a + b
}
func pomnozi(a: Int, _ b: Int) -> Int {
    return a * b
}

var add: (Int, Int) -> Int = saberi
add(2,2)
var multip: (Int, Int) -> Int = pomnozi
multip(4,6)

var newAdd = saberi
newAdd(2,3)

// Nested functions //

func stepForward(Input: Int) -> Int {
    return Input + 1
}
func stepBackward(Input: Int) -> Int {
    return Input - 1
}
func chose(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var curentValue = -3
let move = chose(curentValue > 0)

while curentValue != 0 {
    print("Current value = \(curentValue)...")
    curentValue = move(curentValue)
}

func helloWorldThree() {
    func hello() {
        print("Hello World")
    }
    for _ in 1...3 {
        hello()
    }
}
helloWorldThree()

// Closures //
let greet = { (name: String) -> Void in
    print("Helli \(name)")
}
greet("Belmin")

var namesNew = ["Belmin", "Rijad", "Amer", "Sale", "Guy"]
//Function //
func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversed = namesNew.sort(backwards)

// Closure //
reversed = namesNew.sort( { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

func somFuncTakeClosure( cloure: () -> Void ) {
    // Function body //
}
somFuncTakeClosure({
    
})


// Enums //

enum CompasPoint {
    case North
    case South
    case East
    case West
}

CompasPoint.North
var directionToHed = CompasPoint.East
directionToHed = .West

func whereToHed (direction: CompasPoint) {
    switch direction {
    case .North:
        print("Wear a jacket")
    case .South:
        print("Wear shorts!")
    case .West:
        print("Wear pistol!")
    case .East:
        print("Where the sun rise")
    }
}
whereToHed(.North)

enum ASCICont: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
let controlChar = ASCICont.CarriageReturn
controlChar.rawValue

enum Planet: Int {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
Planet.Mercury.rawValue // Acces Planet enum index/rawValue
print(Planet.Mars.rawValue)

let planet = Planet(rawValue: 4) // planet = Jupiter because Jupiter index is 4


// This is the end of third homework //
