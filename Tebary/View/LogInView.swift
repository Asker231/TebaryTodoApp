//
//  LogInView.swift
//  Tebary
//
//  Created by ASKER on 09.05.2023.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @State var email:String = ""
    @State var password:String = ""
    @EnvironmentObject var authVM:AuthViewModel
    var body: some View {
        VStack(alignment: .center){

            Form{
                HStack{
                    Spacer()
                    ZStack{
                        Image(systemName: "list.clipboard.fill")
                            .resizable()
                            .frame(maxWidth: 30,maxHeight: 35)
                            .foregroundColor(.white)
                    }
                    .padding(30)
                    .background(.green)
                    .cornerRadius(50)
                    Spacer()
                }
                VStack{
                    TextField("Email", text: $email)
                        .frame(width: .infinity, height: 40)
                }.padding(.vertical,5)
                
                VStack{
                    TextField("Password", text: $password)
                        .frame(width: .infinity, height: 40)
                }.padding(.vertical,5)
             
                VStack{
                    Button {
                        Auth.auth().signIn(withEmail: email, password: password){
                            value , error in
                            if let error = error{
                                print(error)
                            }
                            
                            if let value = value{
                                authVM.writeUserId(id: value.user.uid)
                                print(value.user.uid)
                            }
                        }
                    } label: {
                        Text("Войти")
                            .foregroundColor(.white)
                    }.padding(.vertical,20)
            }.frame(maxWidth: .infinity,maxHeight: 50)
                    .background(.cyan)
            }
             
        }
            
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
