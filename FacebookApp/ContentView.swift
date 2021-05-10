//
//  ContentView.swift
//  FacebookApp
//
//  Created by youssef shaban on 09/05/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //1.
    @State var comments = [Post]()
   
    
    
    var body: some View {
        VStack {
        
                //3.
                List(comments) { comment in
                    NavigationLink(destination: PostView(PostC: comment)
                ) {

                    VStack(alignment: .leading) {
                        
                        Text(comment.poster_ID!.username)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(comment.content)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                    }
                    }
                }
                .onAppear() {
                    postApiCall().getPosts { (comments) in
                        self.comments = comments
                    }
                    
                }.navigationTitle("Posts")
                .navigationBarItems(trailing: Button {
                    UserDefaults.standard.removeObject(forKey: "token")

                    self.presentationMode.wrappedValue.dismiss()
                    
                    
                } label: {
                    Text("logout")
                        .padding(20)
                })
            }
        }
        
    }
    

