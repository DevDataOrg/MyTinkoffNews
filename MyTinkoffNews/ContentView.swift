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
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: DetailView(posts: post)) {
                    Text(post.title)
                    Text("f")
                        .padding()
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        //.font(Font.body.bold())
                        //.font(.custom("", size: 38))
                        .foregroundColor(.red)
                        
                }
            }
            .task {
                do {
                    posts = try await loadData()
                } catch {
                    print(error)
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Tinkoff News", displayMode: .automatic)
        }
        
        
        
    }
    func loadData() async throws -> [Post] {
        
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)!
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        return try JSONDecoder().decode([Post].self, from: data)
    }
    
    
}

struct DetailView: View {
    @State var posts: Post
    
    var body: some View {
        VStack {
            Text(posts.body).font(.title)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
