//
//  EmptyView.swift
//  Habittuo
//
//  Created by Valentin Constantin on 03/05/2026.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Text("No activities here yet.").foregroundStyle(.secondary).font(.system(size: 23))
            
            Image(systemName: "figure.run").opacity(0.5)
                .font(.largeTitle)
                .padding()
        }
        
    }
}

#Preview {
    EmptyView()
}
