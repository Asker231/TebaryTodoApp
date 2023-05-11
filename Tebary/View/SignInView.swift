//
//  SignInView.swift
//  Tebary
//
//  Created by ASKER on 09.05.2023.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State var email:String = ""
    @State var password:String = ""
    @State private var name : String = ""
    @State var isLogin = false
    
    @EnvironmentObject var authVM:AuthViewModel
    //@StateObject var authVM:AuthViewModel = AuthViewModel()
    var body: some View {
        VStack{
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
                    .background(.cyan)
                    .cornerRadius(50)
                    Spacer()
                }
                Text("Регистрация")
                    .font(.system(size: 20))
                    .bold()
                VStack(spacing: 10){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Your name")
                            .font(.system(size: 14))
                            TextField("Name",text: $name)
                                .frame(maxWidth: .infinity)

                    }.padding(.vertical,10)
                    VStack(alignment: .leading, spacing: 10){
                        Text("Your email")
                            .font(.system(size: 14))
                        TextField("Email", text: $email)
                            .frame(maxWidth: .infinity)
                    }.padding(.vertical,10)
                    
                    VStack(alignment: .leading){
                        Text("Your password")
                            .font(.system(size: 14))
                        TextField("Password", text: $password)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                           // .textFieldStyle(.roundedBorder)
                    }.padding(.vertical,10)
                        Button {
                            Auth.auth().createUser(withEmail: email, password: password){
                                value,error in
                                if let error  = error{
                                    print(error)
                                }
                                
                                if let value = value{
                                    authVM.writeUserId(id: value.user.uid)
                                    print(value.user.uid)
                                }
                            }
                        } label: {
                            Text("Регистрация")
                                .foregroundColor(.white)
                        }.frame(maxWidth: .infinity,maxHeight: 50)
                            .background(.cyan)
                }.padding(.horizontal,10)
                HStack{
                    Spacer()
                    Button {
                        isLogin.toggle()
                    } label: {
                        Text("войти")
                    }.sheet(isPresented: $isLogin) {
                        LogInView()
                            .environmentObject(authVM)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
