//
//  PostView.swift
//  FacebookApp
//
//  Created by youssef shaban on 09/05/2021.
//

import SwiftUI


struct PostView: View {
    @State var PostC : Post
    
    var body: some View {
        VStack(alignment: .center) {
                Text(PostC.poster_ID!.username)
                    .font(.title)
                    .fontWeight(.bold)
                Text(PostC.content)
                    .font(.subheadline)
                    .fontWeight(.bold)
               
                List(PostC.post!){ comment in
                    Section{
                        VStack{
                        Text(comment.UID!.username)
                        .font(.title3)
                        .fontWeight(.bold)
                        Text(comment.content )
                        .font(.subheadline)
                        .fontWeight(.bold)
                        }
                    }
                    
                }
        }
    }

}
