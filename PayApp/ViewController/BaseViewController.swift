//
//  BaseViewController.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    func handle<T>(state: State<T>) -> T? {
        switch state {
        case .loading:
            self.onLoading()
        case .error(let err):
            self.onError(err.message)
        case .data(let model):
            return model
        default:
            return nil
        }
        return nil
    }
    
    func onLoading() {
        
    }
    
    func onError(_ value: String) {
        
    }
}
