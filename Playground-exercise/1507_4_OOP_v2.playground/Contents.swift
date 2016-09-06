// This is my fourth homework  //
// >>>>>>>>>>  OOP  <<<<<<<< //

import Foundation

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
        return "\(courseName) course by prof. \(teacher.lastName!)"
    }
}

// >>>>> CLASSES <<<<< //

class Person {
    var name: String?
    var lastName: String?
    var yearOfBirth: Int?
    var location: Location
    
    var age: Int {
        let currentYear = 2016
        if yearOfBirth > currentYear {
            return -1
        } else {
            return currentYear - yearOfBirth!
    }
}
    
    init (name: String?, lastName: String?, yearOfBirth: Int?, location: Location?) {
        
        self.name = "[ Name not found ]"
        self.lastName = "[ Last name not found ]"
        self.yearOfBirth = 1990
        self.location = Location()
        
        if let name = name {
            self.name = name
        }
        if let lastName = lastName {
            self.lastName = lastName
        }
        if let yearOfBirth = yearOfBirth {
            self.yearOfBirth = yearOfBirth
        }
        if let location = location {
            self.location = location
        }
    }
    
    convenience init () {
        self.init (
            name: "[ Name not found ]",
            lastName: "[ Last name not found ]",
            yearOfBirth: 1990,
            location: Location()
        )
    }
    
    func introduction () -> String {
        var theIntro = "Hi my name is \(name!) and Last name: \(lastName!). Age: "
        switch age {
        case -1:
            theIntro += "[ Please enter valid date YYYY ]"
        default:
            theIntro += " \(age)"
        }
        return theIntro
    }
}

// >>>>>> SUB CLASSES  <<<<< //


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
        name: String?, lastName: String?, yearOfBirth: Int?, location: Location?, grades: [Int]?, attendingCourses: [Course]?) {
        
        self.attendingCourses = nil
        self.grades = nil
        
        if let attendingCourses = attendingCourses {
            self.attendingCourses = attendingCourses
        }
        if let grades = grades {
            self.grades = grades
        }
        
        super.init(name: name, lastName: lastName, yearOfBirth: yearOfBirth, location: location)
    }
    
    override func introduction() -> String {
        var intString = ""
        intString += super.introduction() + " I'm student at \(faculty). My favourite course is "
        
        if attendingCourses!.isEmpty {
            intString += "[ There is no courses you are attending ]"
        } else {
            intString += attendingCourses!.first!.aboutCourse() + " and my average is \(averageGrade!)"
        }
        return intString
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

let testTeacher = Person(
    name: nil,
    lastName: nil,
    yearOfBirth: 2017,
    location: nil
)
testTeacher.introduction()
//  >>>>  NEW INSTANCES   <<<< //

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
    name: nil,
    lastName:  nil,
    yearOfBirth: 2019,
    location: Location(),
    grades: myGrades2,
    attendingCourses: courses2
)

student2.introduction()
student2.averageGrade


// End of my fourth v2 homework //



