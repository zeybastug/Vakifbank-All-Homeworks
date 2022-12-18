//
//  EpisodesViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 26.11.2022.
//

import UIKit

class EpisodesViewController: UIViewController {
        
    @IBOutlet weak var episodeTableView: UITableView!
    
    var episode = ServiceOperations()
    
    var episodeList:[EpisodeModel] = []
    
    @IBOutlet weak var innerTableView: EpisodesCharactersView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //episodeCharactersView.isHidden = true
        //episodeCharactersView.layer.masksToBounds = true;
        episode.episodeVC = self
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        
        episode.getEpisodeData()
    }
}

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return episodeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeTableViewCell
          
        cell.seasonLabel.text = episodeList[indexPath.row].season
        cell.episodeLabel.text = episodeList[indexPath.row].episode
        cell.titleLabel.text = episodeList[indexPath.row].title
        cell.dateLabel.text = episodeList[indexPath.row].air_date
          
          return cell
    }
    
    private func tableView(_ tableView: UITableViewDelegate, didSelectRowAt indexPath: IndexPath) {
        let episode = episodeList[indexPath.row]

        innerTableView
        innerTableView.isHidden = false
        //episodeCharactersView.layer.zPosition = 2
        
      // episodeCharactersLabel.text = episodeList[indexPath.row].characters
       
    }
    
    
    
    
    
    
}

