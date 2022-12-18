//
//  CharProtocol.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 26.11.2022.
//

import Foundation
import UIKit

protocol CharProtocol {
    
    var charVC:CharactersViewController? {get set}
    func getCharData(url:String)
    func downloadImages(image:String, imageView:UIImageView)
    
}

