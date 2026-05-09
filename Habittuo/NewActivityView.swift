//
//  NewActivityView.swift
//  Habittuo
//
//  Created by Valentin Constantin on 03/05/2026.
//

import SwiftUI

struct NewActivityView: View {
    @Bindable var store: ActivityStore
    @Environment(\.dismiss) var dismiss
    @State var newActivity =  Activity(name: "New Activity", CompletionCount: 0, description: "")
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    
                    Section("Name") {
                        TextField("Enter name", text: $newActivity.name, axis: .vertical).lineLimit(1...2)
                    }
                   
                    Section("Description") {
                        TextField("Enter description", text: $newActivity.description, axis: .vertical).lineLimit(1...6)
                    }
                        
                        
                    
                  
                    
                    
                }.overlay {
                    VStack{
                        Spacer().frame(height: 220)
                        Text("Tip: Press the title to edit the name!").foregroundStyle(.secondary).font(.system(size: 14))
                        
                    }
                    
                }
                
                /// code to add
            }.navigationTitle($newActivity.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Save") {
                        store.activities.append(newActivity)
                        dismiss()
                    }
                }
        }
       
      
    }
}

#Preview {
    NewActivityView(store: ActivityStore())
}
