//
//  DetailsViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 27.11.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    var character:CharacterModel?
    
    var operationObject = ServiceOperations()
    
    //var charVCObject = CharactersViewController()
    @IBOutlet weak var charImage: UIImageView!
    
    @IBOutlet weak var detailName: UILabel!
    
    @IBOutlet weak var detailNickname: UILabel!
    
    @IBOutlet weak var detailBirthday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let char = character {
            operationObject.downloadImages(image: char.img! , imageView: charImage)
        }
        detailName.text = character!.name
        detailNickname.text = character!.nickname
        detailBirthday.text = character!.birthday
        
    }
  
    @IBAction func getQuotes(_ sender: Any) {
        performSegue(withIdentifier: "toQuotes", sender: self)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let quotesVC = segue.destination as? QuotesViewController else { return }
        if let quote = sender as? DetailsViewController {
            quotesVC.detailCharName = quote.character?.name
        }
    }


}
