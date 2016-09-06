// >>>>>>> Vjezba <<<<<<<< //

// Optionals //
var name: String! // var name must contain  value
var comment: String? // var comment can be some value or nil
name = "Belmin"
comment = "Comment"

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // Returns an optional int because value can be int or nil

var serverResponseCode: Int?
serverResponseCode = 404
serverResponseCode = nil // Optional Int? can contain nill

var surveyAnswer: String? // var surveyAnswer = nill
//surveyAnswer = 333 error
surveyAnswer = "String"

// Optionals binding //
if let comment = comment {
    print(comment)
}

if let firstNumber = Int("123"), let secondNumber =
    Int("214") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

if convertedNumber != nil {
    print("Converted contains some integer value of: \(convertedNumber!)") //
}

// Implicity unwrapped optionals //
let possibleString: String? = "An optional string"
let forcedString = possibleString! // Need !

let assumedString: String! = "this is an implicity unwrapped optional string!"
// We strongly clame that assumed string have value and type of string
let implicitString = assumedString // Doesn't need !

if implicitString != nil {
  print(implicitString)
}

if let definiteString = implicitString {
    print(definiteString)
}

// Ternary conditional operator - question ? answer1 : answer2 //
let contentHeight = 50
let bool = true

let rowHeight = contentHeight + (bool ? 40 : 30)  // condition is true so 50 + 40 = 90

let negativeNumber = -3
print("\(negativeNumber > 0 ? "Positive" : "Negative" )")

let dan = true
let noc = false
print("Na nebu se nalazi \(dan ? "Sunce" : "Mjesec")")
print("Na nebu se nalazi \(noc ? "Sunce" : "Mjesec")")

                                            
// Nil Colescing operator  ??  // a != nil ? a! : b
let defaultColor = "Green"
var userDefinedColor: String?

var colorNameToUse =  userDefinedColor ?? defaultColor

var newTown: String?
print(newTown ?? "Travnik") // newTown isn t defined 

var newCar: String?
var oldCar = "Buggati"
print(newCar ?? oldCar) // newCar isn't defined but oldCar is
newCar = "Mercedes"
print(newCar ?? oldCar) // Now newCar is defined

// Range operators //
for i in 1...5 {
    print("\(i) times 5 = \(i * 5)")
}

let names = ["Belmin", "Keno", "Sale", "Lik", "Opa"]

for i in 1..<names.count {
    print("Name: \(i) is: \(names[i])")
}

// String and characters //
var emptyString = String()
var someString = "This is some string!"

emptyString += someString

emptyString.removeAll()

if emptyString.isEmpty == false {
    for character in emptyString.characters {
        print("Chatarcter: \(character)")
    }
} else {
    print("emptyString is actually empty, nothing to see here!")
}
// Conversion Char > String
let collectionOfCharacters:[Character] = ["C", "B", "A", "G", "f", "h"]
let charToString = String(collectionOfCharacters)
print(charToString)

let char:Character = "!"

if someString.isEmpty == false {
    someString.append(char)
} else {
    print("Some string is empty!")
}

let someQuote = "This is some smart quote \"Smart quote\""
let heart = "\u{1F496}"
//Counting characters 
let count = someQuote.characters.count
print("\(someQuote) have: \(count) characters")

var dobroJutro = "Dobro jutro!"
dobroJutro[dobroJutro.startIndex]
dobroJutro[dobroJutro.endIndex.predecessor()]
dobroJutro[dobroJutro.startIndex.successor()]
let index = dobroJutro[dobroJutro.startIndex.advancedBy(3)]

dobroJutro.append(char)
dobroJutro.insert("!", atIndex: dobroJutro.endIndex)

for index in dobroJutro.characters.indices {
    print("\(dobroJutro[index])", terminator: "")
}
// long
if dobroJutro.isEmpty == false {
    for index in 1...dobroJutro.characters.count {
        print("Character: \(index) is: \(dobroJutro[dobroJutro.startIndex.advancedBy(index - 1)])")
        // Printing number of character and than character
    }
} else {
    print("Nothing to see here")
}
// Short version
for i in dobroJutro.characters.indices {
    print("Character \(i) is: \(dobroJutro[i])", separator: " ")
}

dobroJutro.insertContentsOf("This is just a test: ".characters, at: dobroJutro.startIndex)
dobroJutro.removeAtIndex(dobroJutro.startIndex)
dobroJutro.insert("T", atIndex: dobroJutro.startIndex)

let range = dobroJutro.endIndex.advancedBy(-6)..<dobroJutro.endIndex // removing last 6 characters!

let morning = true

var morningMessage = String()
var nightMessage = String()

if morning == true {
    morningMessage.insertContentsOf("Dobro jutro".characters, at: morningMessage.startIndex)
    morningMessage.insert("!", atIndex: morningMessage.endIndex)
    for index in 1..<morningMessage.characters.count {
        print("Number \(index) character is: \(morningMessage[morningMessage.startIndex.advancedBy(index)])")
    }
    morningMessage.removeAtIndex(morningMessage.endIndex.predecessor())
    print("Morning message for today is: \(morningMessage)")
} else {
    nightMessage.insertContentsOf("Laku noc".characters, at: nightMessage.startIndex)
    nightMessage.insert("!", atIndex: nightMessage.endIndex)
    print(nightMessage)
    for i in 1..<nightMessage.characters.count {
        print("\(i) is: \(nightMessage[nightMessage.startIndex.advancedBy(i)])")
    }
    print(nightMessage)
}
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var counter = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
    counter += 1
    }
}
print("There are \(counter) Act 1 scenes")

var mansionCount = 0
var sceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("cell") {
        sceneCount += 1
    }
}
print("There are \(mansionCount) mansions and \(sceneCount) scenes")

// Collection types
// Arrays
var someEmptyArray = [Int]()
someEmptyArray.append(3)
var threeDoubles = [Double](count: 3, repeatedValue: 0.1)

var charString: [Character] = ["A", "B", "C", "D"]

var someStringArray: [String] = ["Eggs", "Milk", "Water"]
someStringArray.append("TEsT")

if someStringArray.isEmpty {
    print("SomeStringArray is empty")
    
} else {
    print("Some string array contain \(someStringArray.count) elements")
}
someStringArray += ["Mlijeko", "This is just a test"]
someStringArray[1]
someStringArray.insert("Kifla", atIndex: 4)
someStringArray.removeFirst()
someStringArray.removeLast()
someStringArray.removeAtIndex(1)
print(someStringArray)

for i in 0..<someStringArray.count {
    print("Element \(i + 1) is \(someStringArray[i])")
}


if someStringArray.isEmpty == false && someEmptyArray.isEmpty == false {
    for index in 0..<someStringArray.count {
        print("Some empty array contains: \(index) is: \(someStringArray[index])")
    }
} else {
    print("There is nothig to see here")
}
someEmptyArray.removeAll()

if someStringArray.isEmpty {
    someStringArray.append("Some")
    someStringArray.insert("hehehe", atIndex: 0)
} else if someEmptyArray.isEmpty {
    someEmptyArray.append(4)
    someEmptyArray.append(5)
    someEmptyArray.count
    someEmptyArray.insert(1, atIndex: 0)
    for i in 1..<someEmptyArray.count {
        print("\(i): \(someEmptyArray[i])")
    }
} else {
    print("Practice")
}
// Sets
var set = Set<Character>() //Empty set
print("Set containts \(set.count) elements")

var newSet: Set = ["Set", "Of", "Strings", "TesT", "One more string"]
newSet.isEmpty
newSet.contains("Set")
print("New set contains \(newSet.count) elements")

if let removedValue = newSet.remove("TesT") {
    print("Removed element from set is \(removedValue)")
} else {
    print("There is no element you searched for.")
}

for i in newSet {
    print("\(i)")
}
var setOfNums: Set<Int> = [1,2,3,4,5,7,9]
var secondSetofNums: Set<Int> = [11,5,6,8,12,13,14]

setOfNums.union(secondSetofNums).sort() // All elements in setOfNums and secondSetOfNums
setOfNums.intersect(secondSetofNums).sort() // all elements common to both sets
setOfNums.exclusiveOr(secondSetofNums).sort() // all elements that are in setOfNums or secondSetofNums
setOfNums.subtract(secondSetofNums).sort() // Elements that are only in first set

var myMusic: Set<String> = ["Rock", "Electro", "Metal", "Jazz"]
var newMusic: Set<String> = ["Balade", "Domaca", "Narodna"]

if myMusic.contains("Rock") {
    print("My favourite music genre is Rock")
} else {
    print("My fovourite music isn't rock")
}

if newMusic.isEmpty == false {
    if newMusic.contains("Rock") {
        print("Rock is the besT")
    } else {
        newMusic.insert("Rock")
        newMusic.contains("Rock")
        print("New music now contains rock")
    }
    for i in newMusic.sort() {
        print("New music is: \(i)")
    }
}
var newList = myMusic.union(newMusic).sort()
newList.count
newList.contains("Test") ?? newList.contains("Rock")

//Dictionaries 
var emptyDictionary = [Int: String]()

emptyDictionary[1] = "One"
emptyDictionary[3] = "Three"
emptyDictionary[5] = "Five"
emptyDictionary = [:]

var cities: [String: String] = ["Tr": "Travnik", "Ze": "Zenica", "Do": "Doboj", "Sa": "Sarajevo"]
cities["Tr"]
cities["Tr"] = "Novi Travink"

if let oldValue = cities.updateValue("Travnik", forKey: "Tr") {
    print("The old value is \(oldValue)")
}

if let citiyName = cities["Tr"] {
    print("City name is: \(citiyName)")
} else {
    print("there is no Tr")
}

if let removedValue = cities.removeValueForKey("Ze") {
    print("\(removedValue)")
} else {
    print("Cities doesn't contain any key of Ze")
}

for (key, name) in cities {
    print("City key: \(key) City name: \(name)")
}
for key in cities.keys {
    print("Key: \(key)")
}
for name in cities.values {
    print("Citiy name is: \(name)")
}
let citiyKeys = [String](cities.keys)
let cityName = [String](cities.values)





