import Foundation

class postApiCall {
    func getPosts(completion:@escaping ([Post]) -> ()) {
        let url = URL(string: "http://localhost:8000/api/posts/")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.setValue("token b9258aab572cf6ea5db62fce5041701f3f4ed2da", forHTTPHeaderField:"Authorization")
        request.timeoutInterval = 60.0
        URLSession.shared.dataTask(with: request) {
                (data: Data?, response: URLResponse?, error: Error?) in
            if let Error = error {
                
                       print("Error took place \(Error)")
                       return
                   }
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            print(posts)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
