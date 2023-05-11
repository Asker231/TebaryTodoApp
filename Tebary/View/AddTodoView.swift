//
//  AddTodoView.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject var addVm:TodoViewModel
    @State var title:String = ""
    @State var text:String = ""
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading,spacing: 40){
                Text("Add todos")
                    .font(.system(size: 20))
                    .bold()
                TextField("Yor title..", text: $title)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color("textfield"))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading){
                    Text("Text...")
                        .font(.system(size: 17))
                        .bold()
                    TextEditor(text: $text)
                        .frame(maxHeight: 250)
                        .colorMultiply(Color("textfield"))
                        .cornerRadius(10)
                        .multilineTextAlignment(.leading)
                }
               
                if title != " " && text != ""{
                    Button {
                        addVm.addTodo(todo: TodoModel(title: self.title, text: self.text))
                        self.title = " "
                        self.text  = " "
                    } label: {
                        Text("AddTodo")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity )
                    .background(.cyan)
                    .cornerRadius(10)
                }else{
                    Button {
                        //
                    } label: {
                        Text("AddTodo")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity )
                    .background(Color("textfield"))
                    .cornerRadius(10)
                }
                

            }
            Spacer()
        }
        .padding(10)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
