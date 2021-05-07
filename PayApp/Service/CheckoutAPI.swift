//
//  CheckoutAPI.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import Foundation


class CheckoutAPI {
    var url = "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json"
    
    func list(_ completion: @escaping (Result<ListResult, APIError>) -> Void) {
        let request = URLRequest(url: URL(string: url)!)
        call(request, completion)
    }
}
