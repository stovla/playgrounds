import UIKit

protocol CalendarDelegate: class {
    func calendar(_ calendar: Calendar, willDisplay year: Int)
    func calendar(_ calendar: Calendar, didSelect date: Date)
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
}

class Calendar {
    weak var delegate: CalendarDelegate?
    
    var selectedDate: Date = Date()
    var currentYear: Int = 2018
    
    func changeDate(to date: Date) {
        selectedDate = date
        delegate?.calendar(self, didSelect: date)
    }
    
    func changeYear(to year: Int) {
        if delegate?.calendarShouldChangeYear(self) ?? true {
            delegate?.calendar(self, willDisplay: year)
            currentYear = year
        }
    }
}

class Reminders: CalendarDelegate {
    var title = "Year: 2018"
    var calendar = Calendar()
    
    init() {
        calendar.delegate = self
    }
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true;
    }
    
    func calendar(_ calendar: Calendar, willDisplay year: Int) {
        title = "Year: \(year)"
    }
    
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected \(date)")
    }
}
