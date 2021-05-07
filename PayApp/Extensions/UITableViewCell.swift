//
//  UITableViewCell.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
