//
//  Employee.swift
//  ThirdWeekHomework
//
//  Created by Zeynep Baştuğ on 21.11.2022.
//

import Foundation

class Employee {
    
    var name:String
    var age:Int
    var maritalStatus:String
    var budget:Int = 0
    var salary:Int?
    
    init (name:String,age:Int,maritalStatus:String) {
        
        self.name = name
        self.age = age
        self.maritalStatus = maritalStatus
        self.salary = age*1000
    }
}
