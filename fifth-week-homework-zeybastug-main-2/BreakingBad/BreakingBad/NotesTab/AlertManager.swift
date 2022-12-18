//
//  AlertManager.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 4.12.2022.
//

import Foundation
import UIKit

protocol AlertShowable {
    func showAlert(with error: AlertError)
}

final class AlertManager: AlertShowable {
    static let shared: AlertManager = .init()
    
    func showAlert(with error: AlertError)  {
        let alert = UIAlertController(title: "Opps!!", message: error.description, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(alert, animated: true)
        }
    }
}
