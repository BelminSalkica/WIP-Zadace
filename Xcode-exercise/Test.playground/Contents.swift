//: Playground - noun: a place where people can play

import UIKit

extension NSDate
{
    convenience
    init(dateString: String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "eeee, yyyy.MM.dd"
        let date = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval: 0, sinceDate: date)
    }
}
class Spending {
    // MARK: Properties
    var amountSpent: Double
    var descriptionOfSpending: String?
    var dateOfSpending: String
    
    // MARK: Initialization
    init?(amountSpent: Double, descriptionOfSpending: String?, dateOfSpending: String) {
        // Initialization should fail if amount spent is negative and description is empty
        if (amountSpent < 0) {
            return nil
        }
        // Initialization of custom properties.
        self.amountSpent = amountSpent
        self.descriptionOfSpending = descriptionOfSpending
        self.dateOfSpending = dateOfSpending
    }
    
    // MARK: Methods
    func today () -> String {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        let date = dateFormatter.stringFromDate(currentDate)
        return date
    }
}

var test = Spending(amountSpent: 4.4, descriptionOfSpending: "Test", dateOfSpending: "Monday, 2015.12.12")
test?.dateOfSpending
