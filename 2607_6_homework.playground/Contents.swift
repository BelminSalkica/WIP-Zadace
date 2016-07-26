// This is my six homework  //
// >>>>>>>>>>  OOP  <<<<<<<< //

import Foundation
// >>>>> PROTOCOLS <<<<< //

protocol MessageHandlerDelegate: class {
    func didRecieveMessage(message: Message)
}
//  >>>> STRUCTS  <<<< //

struct Location {
    var latitude: Double
    var longitude: Double
    
    init () {
        latitude = Double(arc4random() % 181) - 90.0
        longitude = Double(arc4random() % 361) - 90.0
    }
    
}

struct Course {
    let teacher: Person
    let courseName: String
    
    func aboutCourse () -> String {
        return "\(courseName) course by prof. \(teacher.lastName)"
    }
}

struct Contact {
    var name: String
    var phoneNumber: String
}

// Parent sub class //

class Parent: Person {
    var children:[Person]
    var savings: Double?
    
    init (name: String, lastName: String, yearOfBirth: Int?, location: Location, children: [Person], savings: Double?) {
        
        self.children = children
        self.savings = savings
        
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    override func introduction() -> String {
        let intro = super.introduction() + "I'm parent of \(children.count) children "
        return intro
    }
}

// >>>>> CLASSES <<<<< //
// Person class //
class Person: MessageHandlerDelegate {
    var name: String
    var lastName: String
    var yearOfBirth: Int?
    weak var father: Parent?
    weak var mother: Parent?
    var telephone: Telephone?
    
    var location: Location
    
    var age: Int {
        let currentYear = 2016
        if yearOfBirth > currentYear {
            return -1
        } else {
            return currentYear - yearOfBirth!
        }
    }
    
    init (name: String, lastName: String, yearOfBirth: Int?, location: Location) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.location = location
    }
    
    convenience init (name: String, lastName: String) {
        self.init(
            name: name,
            lastName: lastName,
            yearOfBirth: 1990,
            location: Location()
        )
    }
    
    func introduction () -> String {
        var theIntro = "Hi my name is \(name) and Last name: \(lastName). Age: "
        switch age {
        case -1:
            theIntro += "[ Please enter valid date YYYY ]"
        default:
            theIntro += " \(age). "
        }
        return theIntro
    }
    
    func addTelephone(telephone: Telephone) {
        telephone.delegate = self
    }
    func removeTelephone() {
        telephone = nil
        telephone?.delegate = nil
    }
    func didRecieveMessage(message: Message) {
        readMessage(message)
    }
    private func readMessage(message: Message) {
        message.changeStatusToRead()
        print("Hey I've got message from: \(message.sender.name): \(message.text)")
    }
}

class Message {
    enum Status {
        case Recived, Read
    }
    let sender: Contact
    let text: String
    var status: Status = .Recived
    
    init(sender: Contact, text: String) {
        self.sender = sender
        self.text = text
    }
    
    func changeStatusToRead()  {
        status = .Read
    }
}

class Telephone {
    private var messages: [Message] = [Message]()
    var model: String
    weak var delegate: MessageHandlerDelegate?
    
    init(model: String) {
        self.model = model
    }
    
    func addNewMessage(message: Message) {
        messages += [message]
        delegate?.didRecieveMessage(message)
    }
}



// >>>>>> SUB CLASSES  <<<<< //

// Student sub class

class Student: Person {
    var attendingCourses: [Course]?
    var grades: [Int]?
    
    let faculty = "WiP"
    
    var averageGrade: Double? {
        
        if let grades = grades {
            var averageGrade = 0
            
            for grade in grades {
                averageGrade += grade
            }
            if averageGrade > 0 {
                return Double(averageGrade / grades.count)
            }
        }
        return nil
    }
    
    init (
        name: String, lastName: String, yearOfBirth: Int?, location: Location, grades: [Int]?, attendingCourses: [Course]?) {
        
        self.attendingCourses = attendingCourses
        self.grades = grades
        
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    
    override func introduction() -> String {
        
        var intString = super.introduction() + " I'm student at \(faculty). "
        
        if attendingCourses!.isEmpty {
            intString += "[There is no courses you are attending ]"
        } else {
            intString += "My favourite course is" + " " + attendingCourses!.first!.aboutCourse() + " " + "and my average is \(averageGrade!) "
        }
        
        guard(father?.savings != nil || mother?.savings != nil) else {
            intString += "My parents are broke"
            return intString
        }
        
        if let fatherSavings = father?.savings {
            intString += "My father have \(fatherSavings) savings"
        }
        if let motherSavings = mother?.savings {
            intString += "My mother have \(motherSavings) savings"
        }
        return intString
    }
}


// >>>>> EXTENSIONS <<<< //

extension Int  {
    func ageInDays () -> Int{
        return  self * 365
    }
}


//  >>>>> NEW INSTANCES <<<< //

let mirko = Person(
    name: "Mirko",
    lastName: "Babic",
    yearOfBirth: 1987,
    location: Location()
)
mirko.introduction()

let nedim = Person(
    name: "Nedim",
    lastName: "Sabic",
    yearOfBirth: 1982,
    location: Location()
)
nedim.introduction()


//  >>>>  NEW INSTANCES   <<<< //

let IOSDevelopment = Course (
    teacher: mirko,
    courseName: "IOS development"
)
IOSDevelopment.aboutCourse()

let seo = Course (
    teacher: nedim,
    courseName: "SEO"
)
seo.aboutCourse()

var courses = [seo, IOSDevelopment]
let myGrades = [6,7,8,9,10,6,9]

let fatherBelmin: Parent?
let motherBelmin: Parent?
var student: Student?
var brother: Person?
var randomSavings = Double(arc4random() % 10000)

student = Student(
    name: "Belmin",
    lastName: "Salkica",
    yearOfBirth: 1995,
    location: Location(),
    grades: myGrades,
    attendingCourses: courses
)

brother = Person(
    name: "Niko",
    lastName: "Neznanovic",
    yearOfBirth: 1990,
    location: Location()
)

fatherBelmin = Parent(
    name: "Ibro",
    lastName: "Salkica",
    yearOfBirth: 1965,
    location: Location(),
    children: [student!, brother!],
    savings: randomSavings
)

motherBelmin = Parent(
    name: "Mirsada",
    lastName: "Salkica",
    yearOfBirth: 1970,
    location: Location(),
    children: [student!, brother!],
    savings: randomSavings
)

if let student = student { student.father = fatherBelmin }
if let student = student { student.mother = motherBelmin }

fatherBelmin?.introduction()
motherBelmin?.introduction()
student?.introduction()

student?.father?.introduction()
student?.mother?.introduction()
student?.introduction()
// Extension ageInDays
var someInt = 10
someInt.ageInDays()

let studentAgeInDays = student?.age.ageInDays()
let fatherAgeInDays = student?.father?.age.ageInDays()
let motherAgeInDays = student?.mother?.age.ageInDays()


let telephone = Telephone(model: "Samsung galaxy S4")
let personX = Person(name: "Some", lastName: "Guy")
personX.addTelephone(telephone)

let contact1 = Contact(name: "The Guy", phoneNumber: "061 588 980")
let contact2 = Contact(name: "Another Guy", phoneNumber: "051 324 324")
let contact3 = Contact (name: "Main guy", phoneNumber: "061 421 134")

let message1 = Message(sender: contact1, text: "Hi I'm contact1")
let message2 = Message(sender: contact2, text: "Hi I'm contact2")
let message3 = Message(sender: contact3, text: "Hi I'm contact3")

telephone.addNewMessage(message1)
telephone.addNewMessage(message2)
personX.removeTelephone()
telephone.addNewMessage(message3)


