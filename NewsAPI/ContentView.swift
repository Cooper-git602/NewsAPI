//
//  ContentView.swift
//  NewsAPI
//
//  Created by Cooper Fiske-Kneafsey (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading..."
    var body: some View {
        VStack {
         Text(json)
        }
        .task {
           func loadData() async {
               let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-11-10&sortBy=publishedAt&apiKey=a9e0d3ccb1834334b6ef9bb15ba82b8e")!

               let (data, _) = try! await URLSession.shared.data(from: url)
               json = String(decoding: data, as: UTF8.self)
           }
           await loadData()
        }
    }
}

#Preview {
    ContentView()
}
