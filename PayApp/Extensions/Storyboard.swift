//
//  Storyboard.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate(from storyboardName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboardName: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

extension UIViewController : Storyboarded {}
