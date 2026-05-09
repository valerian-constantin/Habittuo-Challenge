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
    @State var editMode = false
 

    @Environment(\.dismiss) var dismiss
 
    var body: some View {
        
            VStack {
                List {
                    Section("\(Image(systemName:"text.alignleft"))   Description") {
                        
                        if editMode {
                            TextField("Enter description", text: $activity.description, axis: .vertical).lineLimit(1...6)
                        } else {
                            if activity.description == "" {
                                Text("No description").foregroundStyle(.secondary).contextMenu {
                                    Button {
                                        editMode.toggle()
                                       
                                            //
                                            
                                        
                                    } label: {
                                        Label("Add description", systemImage: "pencil")
                                        
                                        
                                        
                                    }
                                    
                                }
                            } else {
                                Text(activity.description).contextMenu {
                                    Button {
                                        editMode.toggle()
                                       
                                            //
                                            
                                        
                                    } label: {
                                        Label("Edit description", systemImage: "pencil")
                                        
                                        
                                        
                                    }
                                    
                                }
                            }
                            
                            
                            
                            
                        }
                        
                        
                    }
                    Section("\(Image(systemName:"circle.dotted"))   Completion Count") {
                        Stepper("\(activity.CompletionCount)", value: $activity.CompletionCount)
                    }
                   
                   
                   
                    
                    
                }    .toolbar {
                
                    
                    
                        //code to come
                        if let index = store.activities.firstIndex(where: { $0.id == activity.id }) {
                            
                            if activity.name != store.activities[index].name || activity.CompletionCount != store.activities[index].CompletionCount || activity.description != store.activities[index].description {
                                Button("Save") {
                                    //
                                    store.activities[index].CompletionCount = activity.CompletionCount
                                    store.activities[index].name = activity.name
                                    store.activities[index].description = activity.description
                                    
                                    editMode = false
                                }
                            }
                            if !editMode {
                                Button("Edit") {
                                    editMode.toggle()
                                    //
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
