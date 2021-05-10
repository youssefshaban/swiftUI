//
//  LoginView.swift
//  FacebookApp
//
//  Created by youssef shaban on 09/05/2021.
//
import ToastUI
import SwiftUI

struct LoginView: View {
    @State var status = UserDefaults.standard.string(forKey: "token")
    @State private var isLoading = false
 

    
    
    var body: some View {
       
                 
        VStack {
            
            NavigationView {
                if status != nil {
                    LoginUIView(status: $status)
                }
                
                else {
                    ZStack{
                      
                        postsUIView(status: $status,isloading:$isLoading)
                        
                    }.ignoresSafeArea().background(Color(UIColor.systemBackground))
            }
        }.navigationTitle("Posts")
            .toast(isPresented: $isLoading) {
                  print("Toast dismissed")
                } content: {
                  ToastView("Loading...")
                    .toastViewStyle(IndefiniteProgressToastViewStyle())
                }
        

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

