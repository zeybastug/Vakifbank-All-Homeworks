//
//  EpisodeTableViewCell.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 28.11.2022.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var seasonLabel: UILabel!

    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
