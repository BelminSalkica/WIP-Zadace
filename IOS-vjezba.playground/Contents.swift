// Vjezba

// Var and Const
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempts = 0

//Type annonations

var ovoJeString: String
ovoJeString = "Hello world"

var red, green, blue: Double

//Print

print("Varijabla ovoJeString sadrzi: \(ovoJeString)")

//Comments

//Single line
/*
Multi line comment
*/


// Integer and floating point conversion

let three = 3
let someFloatingNum = 0.14159
let pi = Double(three) + someFloatingNum
let integerPi = Int(pi)

// Booleans 

let orangesAreOranges = true
let aplleAreOranges = false

if aplleAreOranges {
    print("Mmmm jako ukusno")
} else {
    print("uff ovo i nije ukusno")
}


let a = 10
if a == 10 {
    print("a je jednako 10")
} else {
    print("a nije jednako 10")
}

//Tuples 


let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is: \(statusCode)")
print("The status message is: \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The statusCode is: \(statusCode)")

print(http404Error.1)
print(http404Error.0)

let httpsStatus200 = (statusCode: 200, statusMessage:"OK" )
print(httpsStatus200.statusCode)
print(httpsStatus200.statusMessage)

//Optionals

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
if serverResponseCode != 0 {
    print("Ma a nije jednako 0")
}


if serverResponseCode != 0 {
    print("Vrijednost varijable serverResposneCode je: \(serverResponseCode!).")
}

if let actualNumber = Int(possibleNumber){
    print("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    print("\(possibleNumber) could not be converted to an integer value")
}

if let firstNumber = Int("4"), secondNumber = Int("3") where firstNumber > secondNumber {
    print("\(firstNumber) > \(secondNumber)")
}

//Implicity unwrapped optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicity unwrapped string"
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}
//Asserations

//let age = -3

//assert(age >= 0, "ovo ne bi trebalo da sae prikaze jer uslov nije ispunjen")
//Basic Operators 
let name = "Belmin"
if name == "Belmin" {
    print("Hello  \(name)")
} else {
    print("\(name) is not equal to Belmin")
}

let contentHeight = 40
let hasHedaer = true
let rowHeight = contentHeight + (hasHedaer ? 50 : 20)

//Nil Coalescing Operator

let defaulColor = "Blue"
var userColor: String?

var colorNameToUse = userColor ?? defaulColor

var userDefinedColor = "Green"
var colorNameToUse2 = userDefinedColor ?? defaulColor


// Range operators 

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let names = ["Belmin", "Lik", "Ahmed", "The guy"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is \(names[i])")
}
// Logical operators 

let allowedEntry = false
if !allowedEntry {
    print("Acces Denied!!!!")
}

let enterCode = true
let retinaScan = false

if enterCode && retinaScan {
    print("Welcome")
} else {
    print("Acces denied")
}

if enterCode || retinaScan {
    print("One of these are true")
}

// String and characters 

var someString = "Some simple string"
var someEmptyString = ""
var anotherEmptyString = String()

if someEmptyString.isEmpty {
    print("This is an empty string")
}
// String mutability

var variableString = "Some string need "
variableString += "a simple test"

for character in "DOG".characters {
    print(character)
}

let catCharacter: [Character] = ["C","a","t"]
var catString = String(catCharacter)
print(catString)

let exclamationMark: Character = "!"
catString.append(exclamationMark)


let multip = 3
let message = "\(multip) * 2.5 is: \(Double(multip) * 2.5)"

let countingChar = "this is only a test and this is great!"
print("\(countingChar) has \(countingChar.characters.count) characters")

//Accesing characters by index

var greeting = "Guten tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
greeting[greeting.startIndex.advancedBy(3)]

// Inserting and removing 
greeting.insert("!", atIndex: greeting.endIndex)

greeting.insertContentsOf(" and guten morgne".characters, at: greeting.endIndex.predecessor())


// Prefix and sufix equality
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

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes")

var mansionsCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionsCount += 1
    } else if scene.hasSuffix("Lawrence's cell") {
        cellCount += 1
    }
}

