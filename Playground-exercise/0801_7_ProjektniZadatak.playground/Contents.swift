// >>>>>>>>>> 0801_7_ProjektniZadatak <<<<<<<<<< //

import Foundation
// Protocols

protocol DrivingLicence {
    var drivingLicence: Set<DrivingLicenceType> { get set }
}
protocol CarMonitoringDelegate {
    func engineBroke()
    func lowOnFuel()
    func outOfFuel()
}

// Enums

enum DrivingLicenceType {
    case A, B, C, D
}
// Functions

func deleyPrint(printaj: String) {
    sleep(1)
    print(printaj)
}

// Classes
class Person {
    var firstName: String
    var lastName: String
    var age: Int

    init (firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

class Car {
    var name: String
    var model: String
    var licenceType: DrivingLicenceType
    var fuelTank: Int
    var crossedKilometers = 0
    private var fuel: Int = 0
    var broken = false
    var engingOn = false
    var driver: DrivingLicence?
    var delegate: CarMonitoringDelegate?
    
    var fuelLevel: Int {
        get {
            return fuel
        }
        set(newValue) {
            if newValue > fuelTank {
                fuel = fuelTank
            } else {
                fuel = newValue
            }
        }
    }
    
    init(name: String, model: String, licenceType: DrivingLicenceType, fuelTank: Int, fuelLevel: Int) {
        self.name = name
        self.model = model
        self.licenceType = licenceType
        self.fuelTank = fuelTank
        self.fuelLevel = fuelLevel
    }
    func stop() {
        engingOn = false
    }
    func drive() {
        deleyPrint("Starting engine")
        engingOn = true
        
        repeat {
            if broken == true {
                deleyPrint("Engin broke")
                delegate?.engineBroke()
                stop()
            }
            if fuelLevel <= 10 {
                deleyPrint("Fuel low")
                delegate?.lowOnFuel()
            }
            if fuelLevel == 0 {
                deleyPrint("Empty fuel tank")
                delegate?.outOfFuel()
                stop()
            }
            fuelLevel -= 1
            crossedKilometers += 10
            if Int(arc4random() % 100) + 1  == 100 {
                broken = true
            }
        } while engingOn == true 
    }
    func addSomeFuel() {
        deleyPrint("Adding some fuel...")
        let randomFuel = Int(arc4random()) % (fuelTank)
        fuelLevel += randomFuel
        deleyPrint("Added fuel. Current fuel level: \(fuelLevel)")
    }

}

// Sub Classes

class Driver: Person, DrivingLicence {
    var drivingLicence: Set<DrivingLicenceType>
    var mechanic: Mechanic?
    
    var car: Car?
    
    init(firstName: String, lastName: String, age: Int, drivingLicence: Set<DrivingLicenceType>) {
        self.drivingLicence = drivingLicence
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    
    func callMechanic (mechanic: Mechanic, toFixCar car: Car) {
        if mechanic.authorizedServiceForLicenceTypes.contains(car.licenceType) {
            deleyPrint("Mechanic \(mechanic.firstName) respond: he can fix the car")
            mechanic.fixCar(car)
        } else {
            deleyPrint("Mechanic \(mechanic.firstName) respond: I can't fix the car")
        }
    }
    func driveCar () {
        if  drivingLicence.isEmpty == false {
            car?.drive()
        } else {
            deleyPrint("Driver doesn't have appropriate licence type")
        }
    }
}

class Mechanic: Person {
    var authorizedServiceForLicenceTypes: Set<DrivingLicenceType>
    
    init(authorizedServiceForLicenceTypes: Set<DrivingLicenceType>, firstName: String, lastName: String, age: Int) {
        self.authorizedServiceForLicenceTypes = authorizedServiceForLicenceTypes
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    
    func fixCar(car: Car) {
        deleyPrint("\(firstName) is fixin car")
        car.broken = false
        deleyPrint("Car fixed")
    }
}

extension Driver: CarMonitoringDelegate {
    func engineBroke() {
        deleyPrint("Calling mechanic...")
        if let mechanic = mechanic, car = car { callMechanic(mechanic, toFixCar: car) }
//        callMechanic(mechanic!, toFixCar: car!)
    }
    func lowOnFuel() {
        let random = Int(arc4random()) % 3
        
        switch random {
        case 0:
            deleyPrint("I will add some gass now")
        case 1, 2:
            deleyPrint("I willd add some gass later")
        default:
            break
        }
    }
    func outOfFuel() {
        car?.addSomeFuel()
    }
    
}


let driverBelmin = Driver(
    firstName: "Belmin",
    lastName: "Salkica",
    age: 21,
    drivingLicence: [DrivingLicenceType.A]
)
let carBelmin = Car(
    name: "Golf 2",
    model: "Limuzina",
    licenceType: DrivingLicenceType.B,
    fuelTank: 40,
    fuelLevel: 50
)
let mechanicKeno = Mechanic(
    authorizedServiceForLicenceTypes: [DrivingLicenceType.B],
    firstName: "Kenan",
    lastName: "Last namE",
    age: 21
)

driverBelmin.car = carBelmin
carBelmin.delegate = driverBelmin
driverBelmin.mechanic = mechanicKeno

for _ in 1...10 {
    driverBelmin.driveCar()
}
deleyPrint("Car crossed \(carBelmin.crossedKilometers) in this run")


// End of my seven homework

