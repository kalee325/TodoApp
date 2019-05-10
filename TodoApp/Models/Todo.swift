//
//  Todo.swift
//  TodoApp
//
//  Created by Ka Lee on 4/5/19.
//  Copyright © 2019 Ka Lee. All rights reserved.
//

import Foundation

class Todo{
    
    var list: [String]?     //this is defined array to store the tasks
    var listMark: [Int]?    //the array used to check the task's conditions
    
    let userDefault = UserDefaults.standard
    
    
    init(){
        if let test = userDefault.array(forKey: "list") as? [String] {
            list = test
        }else{
            list = []
        }
        
        if let testmark = userDefault.array(forKey: "listMark") as? [Int] {
            listMark = testmark
        }else{
            listMark = []
        }
    }
    
    
    func taskSave() {
        userDefault.set(list, forKey: "list")
        userDefault.set(listMark, forKey: "listMark")
    }
    
    func taskLoad(){
        list = (userDefault.array(forKey: "list") as? [String])
        listMark = (userDefault.array(forKey: "listMark") as? [Int])
    }
    
}
