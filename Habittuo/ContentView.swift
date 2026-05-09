//
//  ContentView.swift
//  Habittuo
//
//  Created by Valentin Constantin on 03/05/2026.
//

import SwiftUI
import Observation

struct ContentView: View {
    func removeRows(at offsets: IndexSet) {
        store.activities.remove(atOffsets: offsets)
    }
    @State var store = ActivityStore()
    var body: some View {
        NavigationStack {
            VStack {
                
                Group {
                    
                    ZStack {
                        
                        
                            
                       
                            List {
                                
                                ForEach(store.activities, id: \.id) { item in
                                    NavigationLink {
                                        ActivityView(activity: item, store: store)
                                        
                                    }
                                    label: {
                                        HStack {
                                            Text(item.name)
                                            Spacer()
                                            Text("\(item.CompletionCount) completions").fontWeight(.bold)
                                        }
                                       
                                    }.contextMenu {
                                        NavigationLink {
                                           
                                                ActivityView(activity: item, store: store)
                                                
                                            
                                        } label: {
                                            Label("Description", systemImage: "text.alignleft")
                                            
                                            
                                            
                                        }
                                        Text("\(item.description)")
                                    }
                                    
                                    
                                    
                                    
                                    //Text(item.name)
                                    
                                }.onDelete(perform: removeRows)
                                
                                
                                if !store.activities.isEmpty {
                                    Section("Debug") {
                                        Button("Add test") {
                                            store.activities.append(Activity(name: "Test", CompletionCount: 10, description: "Test"))
                                        }
                                        Button("Remove all") {
                                            store.activities.removeAll()
                                        }
                                    }
                                   
                                }
                                
                                
                            }.overlay {
                                if store.activities.isEmpty {
                                    EmptyView()
                                }
                            }
                        
                    }.animation(.easeInOut, value: store.activities.isEmpty)
                        
                }.navigationTitle("Habittuo")
                   
                
                
                
             
                
                
            }
                .toolbar {
                  
                        
                       
                   
                        NavigationLink {
                            NewActivityView(store: store)
                        } label: {
                            Image(systemName: "plus")
                        }
                    
                        
                    
                    
                }.toolbar {
                    if !store.activities.isEmpty {
                        ToolbarItemGroup(placement: .topBarLeading) {
                            EditButton()
                            
                        }
                    }
                    
                }
        }
       
      
    }
}

#Preview {
    ContentView()
}
