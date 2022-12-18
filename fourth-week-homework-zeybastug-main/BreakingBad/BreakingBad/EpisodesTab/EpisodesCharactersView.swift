//
//  EpisodesCharactersView.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 29.11.2022.
//

import UIKit

class EpisodesCharactersView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var characters : [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCharCell", for: indexPath) as! EpisodesCharactersTableViewCell
        cell.name.text = characters[indexPath.row]
    
        return cell
    }
    

   

}
