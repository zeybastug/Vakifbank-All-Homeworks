//
//  ViewController.swift
//  ThirdWeekHomework
//
//  Created by Zeynep Baştuğ on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func paySalary(_ sender: Any) {
        
        for i in EmployeeTableView.employeeList {
                
                i.budget += i.salary!
                            
        }
    }
    
    @IBAction func addEmployee(_ sender: Any) {
    }
}

