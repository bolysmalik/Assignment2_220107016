import Foundation

class Student {
    private let name: String
    private var age: Int
    private var grades: [Int]
    
    init(name: String, age: Int, grades: [Int]) {
        self.name = name
        self.age = age
        self.grades = grades
    }
    
    var averageGrade: Double {
        if grades.isEmpty {
            return 0.0
        }
        var sum: Double = 0.0
        grades.map { grade in
            sum += Double(grade)
        }
        return sum / Double(grades.count)
    }
    
    var description: String {
        let status: String
        if averageGrade >= 90 {
            status = "Excellent"
        } else if averageGrade >= 75 {
            status = "Good"
        } else if averageGrade >= 50 {
            status = "Average"
        } else {
            status = "Poor"
        }
        return "\(name); \(averageGrade); \(status)"
    }
    
    func getStatus() -> String {
        switch averageGrade {
        case 0:
            return "New"
        case 1..<4:
            return "Underperforming"
        case 4..<7:
            return "Average"
        case 7..<9:
            return "Good"
        case 9...10:
            return "Excellent"
        default:
            return "Unknown"
        }
    }
    
    func addGrade(grade: Int) {
        grades.append(grade)
    }
}

class ClassRoom {
    private var students: [Student]
    
    init(students: [Student]) {
        self.students = students
    }
    
    func addStudent(student: Student) {
        students.append(student)
    }
    
    func getAverageGrade() -> Double {
        var sum: Double = 0
        if !students.isEmpty {
            return 0.0
        }
        students.map { student in
            sum += student.averageGrade
        }
        return sum / Double(students.count)
    }
}

// MARK: - a
let student = Student(name: "Bolys", age: 20, grades: [5,6,7,8,9,10])
print(student.description)
print(student.getStatus())
print(student.averageGrade)
student.addGrade(grade: 10)
print(student.averageGrade)



// MARK: - 2
class Employee {
    fileprivate let name: String
    fileprivate let surname: String
    fileprivate var salary: Int
    
    init(salary: Int, name: String, surname: String) {
        self.name = name
        self.surname = surname
        self.salary = salary
    }
}

// MARK: - a
let names: [String] = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames: [String] = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jenkins"]

// MARK: - b
var employees: [Employee] = []

// MARK: - c
for _ in 1...10 {
    let randomName = names.randomElement()!
    let randomSurname = surnames.randomElement()!
    let randomSalary = Int.random(in: 1000...2000)
    
    let employee = Employee(salary: randomSalary, name: randomName, surname: randomSurname)
    employees.append(employee)
}

// MARK: - d
func printEmployeeDetails(for employees: [Employee]) {
    for employee in employees {
        print("\(employee.name) \(employee.surname)'s salary is $\(employee.salary)")
    }
    print("-------------")
}

// MARK: - c
func getEvenSalary(employees: [Employee]) -> [Employee] {
    var employeesWithEvenSalary: [Employee] = []
    employees.map { employee in
        if employee.salary % 2 == 0 {
            employeesWithEvenSalary.append(employee)
        }
    }
    return employeesWithEvenSalary
}

printEmployeeDetails(for: employees)
var employeesWithEvenSalary = getEvenSalary(employees: employees)
printEmployeeDetails(for: employeesWithEvenSalary)


// MARK: - 3
class Shape {
    var area: Double {
        return 0.0
    }
    
    var perimeter: Double {
        return 0.0
    }
    
    var description: String {
        return "The area of the shape is \(area). Perimeter is \(perimeter)."
    }
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override var area: Double {
        return Double.pi * radius * radius
    }
    
    override var perimeter: Double {
        return 2 * Double.pi * radius
    }
    
    override var description: String {
        return "The area of the circle is \(String(format: "%.2f", area)). Perimeter is \(String(format: "%.2f", perimeter))."
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override var area: Double {
        return width * height
    }
    
    override var perimeter: Double {
        return 2 * (width + height)
    }
    
    override var description: String {
        return "The area of the rectangle is \(String(format: "%.2f", area)). Perimeter is \(String(format: "%.2f", perimeter))."
    }
}

class Ellipse: Rectangle {
    override var area: Double {
        return Double.pi * (width / 2) * (height / 2)
    }
    
    override var perimeter: Double {
        let a = width / 2
        let b = height / 2
        return Double.pi * (3 * (a + b) - sqrt((3 * a + b) * (a + 3 * b)))
    }
    
    override var description: String {
        return "The area of the ellipse is \(String(format: "%.2f", area)). Perimeter is \(String(format: "%.2f", perimeter))."
    }
}

let circle = Circle(radius: 6)
let rectangle = Rectangle(width: 4, height: 4)
let ellipse = Ellipse(width: 4, height: 5)

print(circle.description)
print(rectangle.description)
print(ellipse.description)
print("---------------")

// MARK: - 4
struct Car {
    var model: String
    var power: Double

    var description: String {
        return "The car model is \(model) with a power of \(power) horsepower."
    }

    mutating func increasePower(by amount: Double) {
        power += amount
    }
}

var myCar = Car(model: "Tesla Model S", power: 670)

print(myCar.description)

myCar.increasePower(by: 50)
print(myCar.description)
print("------------------")


// MARK: - 5
enum CalculationType {
    case addition
    case subtraction
    case multiplication
    case division
}

func calculate(_ firstNumber: Int, _ secondNumber: Int, _ operation: CalculationType) -> Int {
    var result: Int = 0
    let operationName: String

    switch operation {
    case .addition:
        result = firstNumber + secondNumber
        operationName = "addition"
    case .subtraction:
        result = firstNumber - secondNumber
        operationName = "subtraction"
    case .multiplication:
        result = firstNumber * secondNumber
        operationName = "multiplication"
    case .division:
        if secondNumber != 0 {
            result = firstNumber / secondNumber
            operationName = "division"
        } else {
            print("Error: Division by zero is not allowed.")
            return 0
        }
    }

    print("The result of \(operationName) of \(firstNumber) and \(secondNumber) is \(result).")
    return result
}

let _ = calculate(10, 5, .addition)
let _ = calculate(10, 5, .subtraction)
let _ = calculate(10, 5, .multiplication)
let _ = calculate(10, 5, .division)
print("------------------")


// MARK: - 6

enum NonISUCountry: String {
    case usa = "USA"
    case liberia = "Liberia"
    case myanmar = "Myanmar"
}

enum DistanceUnit {
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String])
    case mile(title: String, denotation: String, countries: [NonISUCountry])
}

func printDistanceUnitInfo(unit: DistanceUnit) {
    switch unit {
    case .versta(let title, let denotation, let countries):
        let countryList = countries.joined(separator: ", ")
        print("\(title). Abbreviation: \(denotation). Countries: \(countryList).")
    case .kilometer(let title, let denotation, let countries):
        let countryList = countries.joined(separator: ", ")
        print("\(title). Abbreviation: \(denotation). Countries: \(countryList).")
    case .mile(let title, let denotation, let countries):
        let countryList = countries.map { $0.rawValue }.joined(separator: ", ")
        print("\(title). Abbreviation: \(denotation). Countries: \(countryList).")
    }
}

let verstaUnit = DistanceUnit.versta(title: "Versta", denotation: "verst", countries: ["Russia", "Ukraine"])
let kilometerUnit = DistanceUnit.kilometer(title: "Kilometer", denotation: "km", countries: ["Russia", "European Union"])
let mileUnit = DistanceUnit.mile(title: "Mile", denotation: "mi", countries: [.usa, .liberia, .myanmar])

printDistanceUnitInfo(unit: verstaUnit)
printDistanceUnitInfo(unit: kilometerUnit)
printDistanceUnitInfo(unit: mileUnit)

