//
//  IMDbViewController.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 26.11.2022.
//

import UIKit
import WebKit

class IMDbViewController: UIViewController {
    
    
    @IBOutlet weak var imdbWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imdbWebView.load(URLRequest(url: URL(string: "https://www.imdb.com/title/tt0903747/")!))
        
    }
    

   

}
