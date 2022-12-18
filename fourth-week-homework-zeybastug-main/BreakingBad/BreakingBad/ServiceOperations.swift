//
//  ServiceOperations.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 26.11.2022.
//

import Foundation
import Alamofire
import Kingfisher
import UIKit

class ServiceOperations:CharProtocol {
 
    var charVC:CharactersViewController?
    
    var quoteVC:QuotesViewController?
    
    var episodeVC:EpisodesViewController?
    
    func getCharData(url:String){
        
        //isLoading = true
        AF.request(url).response {
            response in
            if let data = response.data {
                do{
                    let res =  try JSONDecoder().decode([CharacterModel].self, from: data)
                        self.charVC!.charList.append(contentsOf: res)
                        //self.isLoading = false
                        DispatchQueue.main.async {
                            self.charVC!.charsCollectionView.reloadData()
                        }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func downloadImages(image:String, imageView:UIImageView){
        DispatchQueue.main.async {
            let url = URL(string: image)
            imageView.kf.setImage(with: url)
        }
    }
    
    func getQuoteData(author: String) {
        
        AF.request("https://breakingbadapi.com/api/quote?author=\(author)").response {
            response in
            if let data = response.data {
                do{
                    let res =  try JSONDecoder().decode([QuoteModel].self, from: data)
                        self.quoteVC!.charQuote.append(contentsOf: res)
                        //self.isLoading = false
                        DispatchQueue.main.async {
                            self.quoteVC!.quotesTableView.reloadData()
                        }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getEpisodeData() {
        
        AF.request("https://breakingbadapi.com/api/episodes").response {
            response in
            if let data = response.data {
                do{
                    let res =  try JSONDecoder().decode([EpisodeModel].self, from: data)
                        self.episodeVC!.episodeList.append(contentsOf: res)
                        //self.isLoading = false
                        DispatchQueue.main.async {
                            self.episodeVC!.episodeTableView.reloadData()
                        }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
