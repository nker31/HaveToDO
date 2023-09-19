//
//  AddView.swift
//  HaveToDo
//
//  Created by Nathat Kuanthanom on 26/2/2566 BE.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFleidValue:String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Text("Title:")
                        .fontWeight(.semibold)
                    TextField("Type something here", text: $textFleidValue)
                        .frame(width: 300,height: 50)
                }
    
                Button{
                    addRow()
                    
                } label:{
                    Text("Save")
                
                }
            }
        }.navigationTitle("New Task")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func addRow(){
        if(checkText()){
            listViewModel.addItem(title: textFleidValue)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func checkText() -> Bool{
        if(textFleidValue.count < 3){
            alertTitle = "Title should have at least 3 character"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
        
    }
}
