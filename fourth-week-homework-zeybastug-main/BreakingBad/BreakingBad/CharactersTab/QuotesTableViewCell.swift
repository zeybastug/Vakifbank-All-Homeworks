//
//  QuotesViewCell.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 28.11.2022.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {

    @IBOutlet weak var quotesTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
