//
//  NoItemView.swift
//  HaveToDo
//
//  Created by Nathat Kuanthanom on 1/3/2566 BE.
//

import SwiftUI

struct NoItemView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no item here!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("I'm so lonely, please click add button to add my friends")
            }.multilineTextAlignment(.center).padding(20)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView().navigationTitle("Title")
        }
        
    }
}
