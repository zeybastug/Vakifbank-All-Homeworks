//
//  AlertError.swift
//  BreakingBad
//
//  Created by Zeynep Baştuğ on 4.12.2022.
//

import Foundation





enum AlertError: Error {
    case emptyInput
    case wrongInput
    case success
}

extension AlertError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .emptyInput:
            return "Value cannot be blank. Please enter a value."
        case .wrongInput:
            return "Please enter a valid value."
        case .success:
            return "New employee was successfully added."
        
        }
    }
}

