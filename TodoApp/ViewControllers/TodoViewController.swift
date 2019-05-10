//
//  TodoViewController.swift
//  TodoApp
//
//  Created by Ka Lee on 4/4/19.
//  Copyright © 2019 Ka Lee. All rights reserved.
//

import UIKit
import Foundation

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var todoList = Todo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countList = todoList.list {
            return countList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "PostCell")
        
        if let task = todoList.list{
            let mark = todoList.listMark
            if(mark![indexPath.row] == 1) {
                let done = "   ✅ Task is done!"
                cell.textLabel?.text = task[indexPath.row] + done
                cell.textLabel?.textColor = UIColor.gray

            }else{
                cell.textLabel?.text = task[indexPath.row]
                cell.textLabel?.textColor = UIColor.black
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoList.listMark![indexPath.row] *= -1
        tableView.deselectRow(at: indexPath, animated: true)
        todoList.taskSave()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction] {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "Edit", message: "", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.todoList.list![indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: {(updateAction) in
                self.todoList.list! [indexPath.row] = alert.textFields!.first!.text!
                self.todoList.taskSave()
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.todoList.list!.remove(at: indexPath.row)
            self.todoList.listMark!.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            self.todoList.taskSave()
            tableView.reloadData()
        })
        return [deleteAction, editAction]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        todoList.taskLoad()
        tableView.reloadData()
    }

}
