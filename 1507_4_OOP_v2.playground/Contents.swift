// This is my fourth homework  v2 //
// >>>>>>>>>>  OOP  <<<<<<<< //
import Foundation
// Assignment 1 //
// Part 1 //

// 1. //

struct Location {
    var latitude: Double!
    var longitude: Double!
    
    init () {
        latitude = Double(arc4random() % 181) - 90.0
        longitude = Double(arc4random() % 361) - 90.0
    }
    
}

// 2. //

class Person {
    let name: String!
    let lastName: String!
    let yearOfBirth: Int!
    var location: Location
    var age: Int {
        let currentYear = 2016
        if yearOfBirth > currentYear {
            return -1
        } else {
            return currentYear - yearOfBirth
    }
}
    
    init (name: String, lastName: String, yearOfBirth: Int, location: Location) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.location = location
    }
    
    convenience init () {
        self.init (
            name: "Name isn't specified",
            lastName: "Last name isn't specified",
            yearOfBirth: 1990,
            location: Location())
    }
    
    func introduction () -> String {
        var theIntro = "Hi my name is \(name) and Last name: \(lastName). Age: "
        switch age {
        case -1:
            theIntro += "Please enter valid date YYYY"
        default:
            theIntro += " \(age)"
        }
        return theIntro
    }
}

// 3. //

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

// Part 2 //

// 1. //

struct Course {
    let teacher: Person!
    let courseName: String!
    
    func aboutCourse () -> String{
        return "\(courseName) course by prof. \(teacher.lastName)"
    }
}

class Student: Person {
    var attendingCourses: [Course]?
    var grades: [Int]?
    let faculty = "WiP"
    
    var averageGrade: Double {
        
        var sum = 0
        
        if grades!.isEmpty {
            return Double(sum)
        } else {
            for i in grades! {
                sum += i
            }
        }
        return Double(sum / grades!.count)
    }
    
    init (
        name: String, lastName: String, yearOfBirth: Int, location: Location, grades: [Int], attendingCourses: [Course]) {
        self.attendingCourses = attendingCourses
        self.grades = grades
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    
    override func introduction() -> String {
        var intString = ""
        intString += super.introduction() + " I'm student at \(faculty). My favourite course is "
        if attendingCourses!.isEmpty {
            intString += "there is no courses you are listening"
        } else {
            intString += attendingCourses!.first!.aboutCourse() + " and my average is \(averageGrade)"
        }
        return intString
    }
}

// 3. //

let IOSDevelopment = Course(teacher: mirko, courseName: "IOS development")
IOSDevelopment.aboutCourse()

let seo = Course(teacher: nedim, courseName: "SEO")
seo.aboutCourse()

var courses = [seo, IOSDevelopment]
let myGrades = [6,7,8,9,10,6,9]

let student = Student(
    name: "Belmin",
    lastName: "Salkica",
    yearOfBirth: 1995,
    location: Location(),
    grades: myGrades,
    attendingCourses: courses
)
student.introduction()


let courses2 = [Course]()
let myGrades2 = [Int]()


let student2 = Student (
    name: "Ahmed",
    lastName: "Selman",
    yearOfBirth: 2019,
    location: Location(),
    grades: myGrades2,
    attendingCourses: courses2
)
student2.introduction()


// End of my fourth v2 homework //



