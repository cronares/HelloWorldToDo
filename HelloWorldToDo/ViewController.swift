//
//  ViewController.swift
//  HelloWorldToDo
//
//  Created by Kelvin Ding on 4/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataItems = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = dataItems[indexPath.row]
        return cell!
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFields = UITextField()
        let alert = UIAlertController(title: "Add Items", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "Add Items", style: .default, handler: { _ in
            self.dataItems.append(textFields.text!)
        }))
        alert.addTextField { (textField) in
            textField.placeholder = "Add Items to list"
            textFields = textField;
        }
        present(alert, animated: true)
    }
    
}

