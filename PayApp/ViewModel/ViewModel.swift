//
//  ViewModel.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import Foundation

protocol StateChangeDelegate: class {
    func stateDidChange(state: State<[ApplicableNetwork]>)
}

class ViewModel {
    var service: CheckoutAPI!
    weak var delegate: StateChangeDelegate?
    
    
    init(service: CheckoutAPI = CheckoutAPI()) {
        self.service = service
    }
    
    func list() {
        delegate?.stateDidChange(state: .loading)
        service.list { [weak self] response in
            switch response {
            case .success(let data):
                self?.delegate?.stateDidChange(state: .data(data.networks.applicable))
            case .failure(let error):
                self?.delegate?.stateDidChange(state: .error(error))
            }
        }
    }
}
