//
//  State.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import Foundation

enum State<T> {
    case loading
    case error(APIError)
    case data(T)
}
