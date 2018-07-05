//
//  TableViewController.swift
//  DemoCoreDataRegister
//
//  Created by Đừng xóa on 7/3/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "PWall"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.student.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.nameLabel.text = "Name: \(DataService.shared.student[indexPath.row].name!)"
//        cell.ageLabel.text = "Age: \(String(DataService.shared.student[indexPath.row].age))"
//        cell.imageVew.image = DataService.shared.student[indexPath.row].image as? UIImage
        cell.textLabel?.text = "Name: \(DataService.shared.student[indexPath.row].name!)"
        cell.detailTextLabel?.text = "Age: \(String(DataService.shared.student[indexPath.row].age))"
        cell.imageView?.image = DataService.shared.student[indexPath.row].image as? UIImage
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let viewController = segue.destination as? ViewController
            viewController?.object = DataService.shared.student[indexPath.row]
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataService.shared.deleteData(from: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

}
