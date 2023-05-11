//
//  TodoViewModel.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import Foundation

class TodoViewModel:ObservableObject{
    @Published var arrayTodo:[TodoModel] = []
    
//Function add
    func addTodo(todo:TodoModel){
        self.arrayTodo.append(todo)
        }
 //Function remove
    func removeTodo(id:UUID){
        self.arrayTodo.filter { el in
            el.id != id
        }
    }
}
