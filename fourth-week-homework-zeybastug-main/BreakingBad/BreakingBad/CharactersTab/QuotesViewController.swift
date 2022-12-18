//
//  QuotesViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 28.11.2022.
//

import UIKit

class QuotesViewController: UIViewController {
    
    
    @IBOutlet weak var quotesTableView: UITableView!
    
    var quote = ServiceOperations()
    
    var detailCharName:String?
    
    var charQuote:[QuoteModel]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quote.quoteVC = self 
        quotesTableView.dataSource = self
        quotesTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let replace = detailCharName!.replacingOccurrences(of: " " , with: "+", options: .literal, range: nil)
        quote.getQuoteData(author: replace)
        
    }
}

extension QuotesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return charQuote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "quotesCell", for: indexPath) as! QuotesTableViewCell
        
            cell.quotesTextField.text = charQuote[indexPath.row].quote
        
        return cell
    }
    
    
    
    
}
