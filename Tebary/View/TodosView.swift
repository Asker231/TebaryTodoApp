//
//  TodosView.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import SwiftUI

struct TodosView: View {
    @EnvironmentObject var listVm:TodoViewModel
    var body: some View {
        NavigationView{
            List{
                ForEach(listVm.arrayTodo, id: \.self){ el in
                    NavigationLink {
                        DescriptionView(text: el.text ,title: el.title)
                    } label: {
                        Text("\(el.title)")
                    }

                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView()
    }
}
