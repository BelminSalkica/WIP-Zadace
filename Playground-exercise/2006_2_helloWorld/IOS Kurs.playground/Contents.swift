//: Vjezba 2
// Array-s

var array = [1,2]
array.append(3)

var string = [String]()
var array2 = ["Jaje", "Jabuka", "Mlijeko"]
let additionalList = ["test", "Klik", "Lik", "TesT", "test2", "opaa"]
var newList = array2 + additionalList

var newArray = [4]
newArray.append(3)
newArray.isEmpty
newArray.count

newList.removeAtIndex(0)
newList.insert("sir", atIndex: 3)

for (index, value) in newList.enumerate() {
    print("Item \(index + 1) is \(value)")
}

for item in newList {
    print(item)
}

print(newList[0..<newList.count])

for a in "Bih".characters {
    print(a)
}

let love: [Character] = ["L","o","v","e"]
let loveString = String(love)
print(loveString)

var newHelloWorld = "Hello" + "" + "World"
newHelloWorld += "!"

var uzvicnik:Character = "!"
newHelloWorld.append(uzvicnik)

let six = 6
let five = 5
let result = "\(six) + \(five) = \(six + five)"
// SET-s
var letters = Set<Character>()

var favouriteGenres: Set<String> = ["TesT", "Op", "Dolayi", "evropa", "sad ce"]


print("I have \(favouriteGenres.count) favorite genres")


if favouriteGenres.isEmpty {
    print("There is no music you love")
} else {
    print("I have \(favouriteGenres.count) favorite genres")
}

favouriteGenres.insert("jazz")

for genre in favouriteGenres.sort() {
    print(genre)
}
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isStrictSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)




let someSet: Set = [1,3,6,7,9]
let someOtherSet: Set = [2,3,4,6,8,5]
let someDigitalNumbers: Set = [2,5,7,8]
someSet.union(someOtherSet).sort()
someSet.intersect(someOtherSet).sort()
someSet.subtract(someOtherSet).sort()
someSet.exclusiveOr(someDigitalNumbers).sort()

// Dictionary

var namesOfDictionary = [Int: String]()

namesOfDictionary[14] = "This is some string"

var airports = ["YYZ": "Toronto Perason", "DUB": "Dublin"]

print("Airports containts \(airports.count) free airports")

if airports.isEmpty {
    print("Airpotrs are emptiy")
} else {
    print("Airports are not empty")
}

airports["LHR"] = "London"
airports["LHR"] = "London airports"

if let oldValue = airports.updateValue("LONDON", forKey:"LHR") {
    print("The old value is \(oldValue)")
}

if let airportName = airports["YYZ"] {
    print("This is an airport name \(airportName)")
}


if let removedAirport = airports.removeValueForKey("DUB") {
    print("Removed airport is: \(removedAirport)")
} else {
    print("There is no removed airport")
}

for (airportCode, airportName) in airports {
    print("Airport code: \(airportCode) - Airport name: \(airportName)")
}


