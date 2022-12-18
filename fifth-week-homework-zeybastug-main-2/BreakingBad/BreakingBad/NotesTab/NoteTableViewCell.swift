//
//  NoteTableViewCell.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 2.12.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var season: UILabel!
    
    @IBOutlet weak var episode: UILabel!
    
    @IBOutlet weak var note: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
