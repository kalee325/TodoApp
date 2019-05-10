//
//  PostViewController.swift
//  TodoApp
//
//  Created by Ka Lee on 4/4/19.
//  Copyright © 2019 Ka Lee. All rights reserved.
//

import UIKit

class PostViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var postTextView: UITextView!
    
    var todoList = Todo()
    
    @IBAction func postButton(_ sender: Any) {
        if let newTask = postTextView.text {
            if(!newTask.isEmpty){
                todoList.list!.append(newTask)
                todoList.listMark?.append(-1)
                todoList.taskSave()
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTextView.delegate = self
        postTextView.isEditable = true
        
        postTextView.text = "Write something..."
        postTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if postTextView.textColor == UIColor.lightGray {
            postTextView.text = nil
            postTextView.textColor = UIColor.black
        }
    }
    

}
