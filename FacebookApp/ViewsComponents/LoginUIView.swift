//
//  LoginUIView.swift
//  FacebookApp
//
//  Created by youssef shaban on 10/05/2021.
//

import SwiftUI

struct LoginUIView: View {
   
    @State var comments = [Post]()
    @Binding var status : String?
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
            Button {
                UserDefaults.standard.removeObject(forKey: "token")
                self.status=nil
                
            } label: {
                Text("logout")
                    .padding(20)
            }
            }
    }
}

