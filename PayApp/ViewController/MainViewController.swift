//
//  MainViewController.swift
//  PayApp
//
//  Created by İbrahim Oktay on 7.05.2021.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var datasource: GenericDataSource<ApplicableNetwork, PaymentOptionCell>!
    let vm = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        vm.delegate = self
        vm.list()
    }
    
    func initUI() {
        title = "Payment Methods"
//        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
}

extension MainViewController: StateChangeDelegate {
    
    func stateDidChange(state: State<[ApplicableNetwork]>) {
        if let model = self.handle(state: state) {
            datasource = GenericDataSource<ApplicableNetwork, PaymentOptionCell>(models: model) { item, cell in
                if let url = item.links?["logo"] {
                    cell.logo.load(url: url)
                    cell.title.text = item.label
                }
            }
            tableView.dataSource = datasource
            tableView.reloadData()
        }
    }
}

//extension MainViewController: UITableViewDelegate {}
