//
//  DescriptionView.swift
//  Tebary
//
//  Created by ASKER on 11.05.2023.
//

import SwiftUI

struct DescriptionView: View {
    @State var text:String = ""
    @State var title:String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("\(self.text)")
                .foregroundColor(.black)
                .font(.system(size: 16))
                .bold()
            Spacer()
                .navigationTitle(self.title)
        }.padding(10)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
