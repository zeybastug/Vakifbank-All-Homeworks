//
//  ViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 26.11.2022.
//

import UIKit

class CharactersViewController: UIViewController {
    
    var charProtocolObject:CharProtocol?
        
    var toDetail = DetailsViewController()
    
    var charList:[CharacterModel] = []

    @IBOutlet weak var charsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charsCollectionView.dataSource = self
        charsCollectionView.delegate = self
        charProtocolObject = ServiceOperations()
        charProtocolObject?.charVC = self
        //charsCollectionView.reloadData()
        

    }

    override func viewWillAppear(_ animated: Bool) {
        charProtocolObject?.getCharData(url: "https://breakingbadapi.com/api/characters")

    }
    
}

extension CharactersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charCell", for: indexPath) as! CharactersCollectionViewCell
        
        
       let photo = charList[indexPath.row]
        //charProtocolObject!.downloadImages(image: photo.img!, imageView: toDetail.charImage)
        
        cell.name.text = charList[indexPath.row].name
        cell.nickName.text = charList[indexPath.row].nickname
        cell.birthday.text = charList[indexPath.row].birthday
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailPageTransition", sender: charList[indexPath.row])
      
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let firstVC = segue.destination as? DetailsViewController else { return }
        if let character = sender as? CharacterModel {
            firstVC.character = character

        }
    }
    
}

