//
//  EmployeeTableView.swift
//  ThirdWeekHomework
//
//  Created by Zeynep Baştuğ on 20.11.2022.
//

import UIKit

class EmployeeTableView: UIViewController {
    
    @IBOutlet weak var nameHeader: UILabel!
    
    @IBOutlet weak var ageHeader: UILabel!
    
    @IBOutlet weak var maritalHeader: UILabel!
    
    @IBOutlet weak var budgetHeader: UILabel!
    
    //@IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var employeeTv: UITableView!
    
    static var employeeList:[Employee] = []
    
    var employeeSearch:[Employee] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        employeeTv.delegate = self
        employeeTv.dataSource = self
        
        employeeSearch = EmployeeTableView.employeeList 
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }

}

extension EmployeeTableView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return}
        
        EmployeeTableView.employeeList = employeeSearch.filter({ $0.name.starts(with: text)})
        
        if text == "" {
            
            EmployeeTableView.employeeList = employeeSearch
        }
            employeeTv.reloadData()
    }
}



extension EmployeeTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeTableView.employeeList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let employee = EmployeeTableView.employeeList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as! TableViewCell
        
        cell.name.text = employee.name
        cell.age.text = String(employee.age)
        cell.maritalStatus.text = employee.maritalStatus
        cell.budget.text = String(employee.budget)
        
        return cell
    }
    
    
}
