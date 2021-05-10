import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    let content: String
    let poster_ID : poster_ID?
    let post : [post]?

    
}
 struct  poster_ID: Codable {
    let username : String
    
}
struct  post: Codable ,Identifiable {
    let id = UUID()
    let content : String
    let UID :UID?
}
struct  UID: Codable {
   let username : String
   
}
