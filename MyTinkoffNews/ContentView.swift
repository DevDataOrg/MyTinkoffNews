//
//  ContentView.swift
//  MyTinkoffNews
//
//  Created by Artyom Romanchuk on 25.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State var posts = [Post]()
    
    var body: some View {
        List(posts) { post in
            Text("\(post.body)")
        }
        .task {
                    do {
                        posts = try await loadData()
                    } catch {
                        print(error)
                    }
                }
    }
    func loadData() async throws -> [Post] {
            
            let urlString = "https://jsonplaceholder.typicode.com/posts"
            let url = URL(string: urlString)!
            
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            return try JSONDecoder().decode([Post].self, from: data)
        }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
