//
//  ActivityView.swift
//  Habittuo
//
//  Created by Valentin Constantin on 03/05/2026.
//

import SwiftUI

struct ActivityView: View {
    @State var activity: Activity
    @Bindable var store: ActivityStore
 

    @Environment(\.dismiss) var dismiss
 
    var body: some View {
        
            VStack {
                List {
                    Section("Description") {
                        Text(activity.description)
                    }
                    Stepper("\(activity.CompletionCount)", value: $activity.CompletionCount)
                   
                   
                    
                    
                }    .toolbar {
                
                    
                    
                        //code to come
                        if let index = store.activities.firstIndex(where: { $0.id == activity.id }) {
                            
                            if activity.name != store.activities[index].name || activity.CompletionCount != store.activities[index].CompletionCount {
                                Button("Save") {
                                    //
                                    store.activities[index].CompletionCount = activity.CompletionCount
                                    store.activities[index].name = activity.name
                                    dismiss()
                                }
                            }
                            
                           
                            
                        }
                    
                }
                
                
                
                /// code to add
            }.navigationTitle($activity.name)
                .navigationBarTitleDisplayMode(.inline)
            
               
        
       
      
    }
}

#Preview {
    ActivityView(activity: Activity(name: "Testare", CompletionCount: 17, description: "Descriere"), store: ActivityStore())
}
