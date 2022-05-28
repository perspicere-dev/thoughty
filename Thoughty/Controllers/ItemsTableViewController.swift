//
//  ItemsTableViewController.swift
//  Thoughty
//
//  Created by Przemysław Wnęk on 15/05/2022.
//
import Foundation
import UIKit

class ItemsTableViewController: UITableViewController {
    
    var items: [Item] = [
        Item(title: "Title", date: getCurrentDate(), bodyText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupTableView()
        configureAddNewItemButton()
    }
        
    func setupTableView() {
        tableView.rowHeight = 150
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
        tableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        let item = items[indexPath.row]
        cell.titleText.text = item.title
        cell.dateValue.text = item.date
        cell.bodyText.text = item.bodyText
        
        return cell
    }
    
    func configureAddNewItemButton() {
        let addNewItemButoon = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addButtonPressed))
        self.navigationItem.rightBarButtonItem = addNewItemButoon
    }
    
    @objc func addButtonPressed() {
        let itemVC = ItemViewController()
        itemVC.delegate = self
        self.present(itemVC, animated: false, completion: nil)
    }
}

extension ItemsTableViewController: UserAddsNewItem {
    func didAddNewItem(title: String?, body: String?) {
        if let itemTitle = title, let itemBody = body {
            let newItem = Item(title: itemTitle, date: getCurrentDate(), bodyText: itemBody)
            items.append(newItem)
            self.tableView.reloadData()
        } else {
            print("error")
        }
       print("title: ", title!)
    }
}
//MARK: heleper for current date in desired formatt

func getCurrentDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YY/MM/dd"
    let currentDate = dateFormatter.string(from: date)

    return currentDate
}
