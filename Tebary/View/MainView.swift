//
//  MainView.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import SwiftUI

struct MainView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    @EnvironmentObject var authVM:AuthViewModel
    @StateObject       var todoVM = TodoViewModel()
    
    
    @State private var select = 1
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $select){
                HomeView()
                    .tag(1)
                AddTodoView()
                    .environmentObject(todoVM)
                    .tag(2)
                TodosView()
                    .environmentObject(todoVM)
                    .tag(3)
                SettingView()
                    .environmentObject(authVM)
                    .tag(4)
            }
//MARK: -  TabViewSection
            HStack{
                Spacer()
//MARK: - HomeBtn
                HStack(alignment: .bottom){
                   select == 1 ?
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                    
                    : nil
                    Button {
                        withAnimation {
                            self.select = 1
                        }
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(select == 1 ? .white : .gray)
                    }
                }
                .padding(4)
                .background(select == 1 ? .cyan : .clear )
                .cornerRadius(10)
                Spacer()
 //MARK: - TodosBtn
                HStack(alignment: .bottom){
                    select == 2 ?
                    Text("Todos")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                    : nil
                    Button {
                        withAnimation {
                            self.select = 2
                        }
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(select == 2 ? .white : .gray)
                    }
                }
                .padding(4)
                .background(select == 2 ? .cyan : .clear )
                .cornerRadius(10)
                Spacer()
//MARK: - AddTodos
                HStack(alignment: .bottom){
                    select == 3 ?
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                    : nil
                    Button {
                        withAnimation {
                            self.select = 3
                        }
                    } label: {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(select == 3 ? .white : .gray)
                    }
                }
                .padding(4)
                .background(select == 3 ? .cyan : .clear )
                .cornerRadius(10)
                Spacer()
//MARK: - SettingView
                HStack{
                    Button {
                        withAnimation {
                            self.select = 4
                        }
                    } label: {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(select == 4 ? .white : .gray)
                    }
                }
                .padding(4)
                .background(select == 4 ? .cyan : .clear )
                .cornerRadius(10)
                Spacer()
                
            }.padding(.vertical,10)
                .foregroundColor(.white)
        }
    }
}





struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
