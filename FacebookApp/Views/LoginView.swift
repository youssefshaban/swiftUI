//
//  LoginView.swift
//  FacebookApp
//
//  Created by youssef shaban on 09/05/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var status = UserDefaults.standard.object(forKey: "token")
    @State var username: String = ""
      @State var password: String = ""
        @State var action: Bool = false
          @State var isloading : Bool = false
    @State var comments = [Post]()
    var body: some View {
       
                 
        VStack {
            
            NavigationView {
                if status != nil {
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
                
                else {
                        VStack {
                            TextField("Username", text: $username)
                                .padding()
                                .cornerRadius(5.0)
                                
                            SecureField("Password", text: $password)
                                .padding()
                                .cornerRadius(5.0)
                                
//                            NavigationLink(destination: ContentView(),isActive: $action) {
//                                if !isloading{
                                 Button {
                                    isloading=true
                                     do{
                                        try LoginVM().login(completion: { _ in [Login].self
                                        
                                     }, username: self.username, Passwors: self.password)
                                        isloading=false
                                         self.action=true
                                      
                                        self.status="LogedIn"

                                     }catch{
                                        print(error)
                                        isloading=false
                                         
                                     }
                                     
                                 } label: {
                                     Text("LOGIN")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 220, height: 60)
                                    .cornerRadius(15.0)
                                 }
                                 
                                 
                                 
                                
                                 .contentShape(Rectangle())}.navigationTitle("Login")
//                                else{
//                                    Text("loading")
//                                }
//                                }.isDetailLink(false)
//                        }.padding()
             
            }
        }.navigationTitle("Posts")
        

       }
   
}
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
           
        }
    }
}

