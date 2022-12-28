//
//  ViewController.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import UIKit

class ViewController: UIViewController,APIProtocol {
    func finished(_ data: [SpaceXModel]) {
        spaceXLaunches = data

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    let apiManager = APIManager()

    @IBOutlet weak var tableView: UITableView!
    
    var spaceXLaunches: [SpaceXModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = K.mainTitle
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.spaceXTableCell, bundle: nil), forCellReuseIdentifier: K.spaceXTableCell)
        
        apiManager.delegate = self
        
        apiManager.getData(urlString: .SpaceXLaunchs)
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceXLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.spaceXTableCell) as? SpaceXTableCell else{
            return UITableViewCell()
        }


        cell.launch = spaceXLaunches[indexPath.row]
        cell.setUpCell()
        
        
        return cell
        
    }
    
    
    
    
}

