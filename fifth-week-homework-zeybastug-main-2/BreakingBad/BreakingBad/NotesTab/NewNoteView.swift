
//  NewNoteView.swift
//  CryptoCo
//
//  Created by Baturalp Karamus on 26.11.2022.
//

import UIKit

protocol NewNoteViewDelegate: AnyObject {
    func savePressed(note: String, season:String, episode:String)
}

final class NewNoteView: UIView {

    @IBOutlet weak var seasonTextField: UITextField!
    
    
    @IBOutlet weak var episodeTextField: UITextField!
    
    @IBOutlet weak var noteTextView: UITextView!
    weak var delegate: NewNoteViewDelegate?
    
   
    
  

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "New", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
       
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let season = Int(seasonTextField.text!)
        let episode = Int(episodeTextField.text!)
        if (seasonTextField.text!.isEmpty == false) && (season! < 6) && (episode! < 25) {
            delegate?.savePressed(note: noteTextView.text,season: seasonTextField.text! ,episode: episodeTextField.text!)
        } else if (seasonTextField.text!.isEmpty) || (episodeTextField.text!.isEmpty){
            AlertManager.shared.showAlert(with: .emptyInput)
        }
        else {
            AlertManager.shared.showAlert(with: .wrongInput)
        }
            removeFromSuperview()
        
    }

}

