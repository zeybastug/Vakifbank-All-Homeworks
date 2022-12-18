import Foundation

var greeting = "Hello, playground"

class myCompany {
   
    let name = "Anjos70"
    let year = 1987
    var budget = 20000000
    
    var employee:[Employee] = []
 
    func addEmployee(newEmployee:Employee) {
        
        newEmployee.salary = newEmployee.calculateSalary()

        employee.append(newEmployee)
        
    }
    
    func paySalary(e:Employee) {
        
        for i in employee {
            
            i.budget! += i.salary!
            
            budget -= i.salary!
        }
    }
}


class Employee:Calculator {
    
    func calculateSalary() -> Int {
        
        return 0
    }
    
    var budget:Int?
    var name:String?
    var age:Int?
    var isSingle:Bool?
    var salary:Int?
    
    init(name:String, age:Int, isSingle:Bool) {
        
        self.name = name
        self.age = age
        self.isSingle = isSingle
    }
}
protocol Calculator {
    
    
    func calculateSalary() -> Int
}

class Junior : Employee {

    
    override func calculateSalary() -> Int {
        
        return 1000 * age!
        
    }
}

class Mid:Employee {


     override func calculateSalary() -> Int {
        
        return 2000 * age!

    }
}

class Senior:Employee {

    override func calculateSalary() -> Int {
        
        return 4000 * age!

    }
}

var company = myCompany()
var member:Employee = Junior(name: "Zeynep", age: 24, isSingle: false)

company.addEmployee(newEmployee: member)

print(company.employee[0].name!)



// Zoo Project

class Zoo {
    
    
    var animals:[Animal] = []
    var keepers:[Keeper] = []
    var budget = 70000000
    var waterLimit:Int
    var bitBudget:Int
    
    init(waterLimit:Int, bitBudget:Int) {
        
        self.waterLimit = waterLimit
        self.bitBudget = bitBudget
    }
    
    func incWaterLimit(value:Int){
        
        waterLimit += value
    }
    
    func addAnimal(new:Animal){
        
        animals.append(new)
        waterLimit -= new.consumedWater
    }
    
    func paySalary() {
        
        for i in keepers {
            
            i.wallet += i.salary
            budget -= i.salary
        }
        
    }
    
    func addKeeper(new:Keeper){
        
        keepers.append(new)
        
    }
}

class Animal {
    
    var keeper:Keeper
    var consumedWater:Int
    func voice() {

    }
    
    init(keeper:Keeper, cons:Int){
        self.keeper = keeper
        self.consumedWater = cons
    }
}

class Keeper {
    
    var animals:[Animal] = []
    var salary = 50000
    var wallet = 0
}
