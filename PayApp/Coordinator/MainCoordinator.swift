//
//  MainCoordinator.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.barTintColor = UIColor(displayP3Red: 0, green: 137.0/255, blue: 65.0/255, alpha: 1)
        self.navigationController.navigationBar.isTranslucent = true
    }
    
    func start() {
        let controller = MainViewController.instantiate(from: "Main")
        navigationController.pushViewController(controller, animated: true)
    }
}
