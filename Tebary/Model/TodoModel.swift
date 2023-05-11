//
//  TodoModel.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import SwiftUI


struct TodoModel:Hashable,Identifiable{
    let id = UUID()
    let title:String
    let text:String
}
