//
//  ContentView.swift
//  LazyGrid-SwiftUI
//
//  Created by Mitya Kim on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    
    let columns: [GridItem] = [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    private func headerView(_ index: Int) -> some View {
        Text("Section \(index)")
            .padding()
            .foregroundColor(.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(.blue)
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    
                    ForEach(1..<10) { index in
                        
                        Section(header: headerView(index)) {
                            ForEach(1..<20) { _ in
                                Rectangle()
                                    .fill(.green)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }.padding()
            }.navigationTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
