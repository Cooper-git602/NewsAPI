//
//  ContentView.swift
//  NewsAPI
//
//  Created by Cooper Fiske-Kneafsey (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data = FetchData()
    
    @State var json = "Loading..."
    var body: some View {
        ScrollView{
            ForEach(data.response.articles){
                a in
                VStack (alignment: .leading, content: {
                    Text(a.title ?? "")
                }).padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
            }
        }
        .task {
            await data.getData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
