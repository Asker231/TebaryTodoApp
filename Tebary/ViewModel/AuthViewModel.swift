//
//  AuthViewModel.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import Foundation

class AuthViewModel:ObservableObject{
    @Published var userId:String = " "
    
    func writeUserId(id:String){
        self.userId = id
    }
}
