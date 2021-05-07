//
//  GenericDataSource.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

class GenericDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    
    typealias Configurator = (Model, Cell) -> Void
    
    var models: [Model]!
    var configurator: Configurator!
    
    init(models: [Model], configurator: @escaping Configurator) {
        self.models = models
        self.configurator = configurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
        configurator(model, cell)
        return cell
    }
    
    func get(index: Int) -> Any {
        return models[index]
    }
}
