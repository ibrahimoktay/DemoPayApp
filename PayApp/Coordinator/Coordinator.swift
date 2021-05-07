//
//  Coordinator.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
