//
//  SettingView.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import SwiftUI
import FirebaseAuth

struct SettingView: View {
    @EnvironmentObject var authVm:AuthViewModel
    
    var body: some View {
        VStack{
            Button {
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    authVm.userId = " "
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            } label: {
                Text("Exit")
            }

        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
