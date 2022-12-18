//
//  AddEmployeeVC.swift
//  ThirdWeekHomework
//
//  Created by Zeynep Baştuğ on 21.11.2022.
//

import UIKit

class AddEmployeeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var ageText: UITextField!
    
    var pickerData:[String] = ["Single", "Married"]
    
    var maritalstatusText : String = ""
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        maritalstatusText = pickerData[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        picker.dataSource = self
    }
    
    
    
    @IBAction func addEmployee(_ sender: Any) {
        
        let employee = Employee(name:self.nameText.text!, age:Int(ageText.text!)!, maritalStatus: self.maritalstatusText)
        EmployeeTableView.employeeList.append(employee)
    }
    
    
    
   
}
