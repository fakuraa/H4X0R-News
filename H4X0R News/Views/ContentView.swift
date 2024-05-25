//
//  ContentView.swift
//  H4X0R News
//
//  Created by Fadil Kurniawan on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var netM = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(netM.posts){ val in
                NavigationLink(destination: DetailView(url: val.url)){
                    HStack{
                        Text(String(val.points ?? 0))
                        Text(val.title ?? "")
                    }
                }
            }
            .navigationTitle("H4X0R News")
        }
        .onAppear{
            self.netM.fetchData()
        }
    }
    
}

#Preview {
    ContentView()
}
