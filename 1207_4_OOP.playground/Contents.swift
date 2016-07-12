// This is my fourth homework //
// >>>>>>>>>>  OOP  <<<<<<<< //
import Foundation // Foundation enables arc4random method
// Assignment 1 //
// Part 1 //
// 1. //
struct Location {
    var latitude: Double, longitude: Double
    init () {
        latitude = Double(arc4random() % 181) - 90.0
        longitude = Double(arc4random() % 361) - 90.0
    } // We crated new struct Location with 2 variables latitude and longitude
     // inint () will set random Double values, here we use Foundation framework
}
// 2. //
class Person { // Creating new Preson class
    let name: String
    let lastName: String
    let yearOfBirth: Int
    var location = Location()
    var age: Int { // Computed property which returns currentYear - yearOfBirth
        let currentYear = 2016
        return currentYear - yearOfBirth
    }
    init (name: String, lastName: String, yearOfBirth: Int, location: Location) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.location = location
    }
    // We set values with designated init, self.name reffers to constant name and name reffers to parameter name: String.
    convenience init (name: String, lastName: String) {
        self.init(name: name, lastName: lastName, yearOfBirth: 1990, location: Location())
    } // We set values with convenience init when there is no enough data to set values with designated init.
    func introduction () -> String {
        return "Hi, my name is \(name) \(lastName). Age: \(age)"
    } // Simple method whic returns String with name, last name and age.
}

// 3. //
// Creating constant mirko with class Person
let mirko = Person(
    name: "Mirko",
    lastName: "Babic",
    yearOfBirth: 1987,
    location: Location()
)
// Calling introduction methond on Person mirko.
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
struct Course { // Creating structure Course with 2 constants and one method
    let teacher: Person
    let courseName: String
    func aboutCourse () -> String{
        return "\(courseName) course by prof. \(teacher.lastName)"
    }
}

class Student: Person { // Creating new class Student based on superClass Person
    var attendingCourses: [Course]
    var grades: [Int]
    let faculty = "WiP"
    var averageGrade: Double { // computed property which return averageGrade
        var sum = 0
        for i in grades {
            sum += i
        }
        return Double(sum / grades.count)
    }
    init (name: String, lastName: String, yearOfBirth: Int, location: Location, grades: [Int], attendingCourses: [Course]) { // Initialization
        self.attendingCourses = attendingCourses // Initialization of Student properties courses and grades
        self.grades = grades
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location) // Initialization of superClass properties
    }
    override func introduction() -> String {
        return "I'm student at: \(faculty). My favourite course is: \(attendingCourses.first!.aboutCourse())"
    } // Overriding already existing method in superClass Person
}
// 3. //

let IOSDevelopment = Course(teacher: mirko, courseName: "IOS development") // Adding new course
IOSDevelopment.aboutCourse() // Calling method which will tell us something about course
let seo = Course(teacher: nedim, courseName: "SEO") // Adding another one
seo.aboutCourse() // ...

var courses = [seo, IOSDevelopment]
let myGrades = [6,9,7,8,9,10,6]
let student = Student(
    name: "Belmin",
    lastName: "Salkica",
    yearOfBirth: 1995,
    location: Location(),
    grades: myGrades,
    attendingCourses: courses
)

student.introduction()
student.averageGrade



// End of my fourth homework //



