//
//  UsersViewController.swift
//  AsalTask
//
//  Created by Amr Abu Zant on 10/12/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "UserCell"
    
    var dataSource : [User] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Users"
        
        loadUsers()
        tableView.tableFooterView = UIView(frame: .zero)
    }

    func loadUsers(){
        APIMethods.getUsers { [weak self] (data, error) in
            if error == nil {
                self?.dataSource = data ?? []
            } else {
                debugPrint(error!)
            }
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? UserDetailsViewController{
            if let cell = sender as? UITableViewCell{
                destinationVC.userInfo = dataSource.first(where: { (item) -> Bool in
                    item.name == cell.textLabel?.text
                })
            }
        }
    }


}


extension UsersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let user = dataSource[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
    
    
}
