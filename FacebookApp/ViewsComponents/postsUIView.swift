//
//  postsUIView.swift
//  FacebookApp
//
//  Created by youssef shaban on 10/05/2021.
//

import SwiftUI
import ToastUI
struct postsUIView: View {
    @State var username: String = ""
    @Binding var status : String?
    @State var password: String = ""
    @State var LoginRes : [Login]?
    @State var Error: Bool = false
    @Binding var isloading : Bool 
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                
            SecureField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                 Button {
                    isloading=true
                     do{
                        self.isloading=true
                        var x = try LoginVM().login(completion: { Login in
                            print("=======")
                            self.LoginRes = Login
                        }, username: self.username, Passwors: self.password)
                        print(x)
                        self.isloading=false
                        self.status=UserDefaults.standard.string(forKey: "token")
                     }catch{
                        self.Error=true
                        self.isloading=false
                     }
                     
                 } label: {
                     Text("LOGIN")
                    .font(.headline)
                    .padding()
                    .frame(width: 220, height: 60)
                    .cornerRadius(15.0)
                 }
                 
                 
                 .toast(isPresented: $Error, dismissAfter: 2.0) {
                       print("Error")
                     } content: {
                       ToastView("Error")
                         .toastViewStyle(ErrorToastViewStyle())
                     }
                 .contentShape(Rectangle())}.navigationTitle("Login")
    }
}


