//
//  ViewController.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import UIKit

class ViewController: UIViewController,ViewModelProtocol {

    
    let viewModel = SpaceXViewModel()

    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = K.mainTitle
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.spaceXTableCell, bundle: nil), forCellReuseIdentifier: K.spaceXTableCell)
        
        viewModel.delegate = self
        viewModel.getSpaceXData()
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.spaceXTableCell) as? SpaceXTableCell else{
            return UITableViewCell()
        }

        cell.launch = viewModel.getSpaceLaunch(for: indexPath.row)
        cell.setUpCell()
        
        return cell
    }
    
    
    
    
}

