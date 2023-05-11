//
//  ContentView.swift
//  Tebary
//
//  Created by ASKER on 09.05.2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
   // @AppStorage("uid") var userID = " "
     @StateObject var userIdes  = AuthViewModel()
    var body: some View {
        VStack {
            if userIdes.userId == " "{
                SignInView()
                    .environmentObject(userIdes)
            }else{
                MainView()
                    .environmentObject(userIdes)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
