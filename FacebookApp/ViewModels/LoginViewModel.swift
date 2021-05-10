import Foundation


class LoginVM{
    enum VendingMachineError: Error {
        case invalidSelection
        case insufficientFunds(coinsNeeded: Int)
        case outOfStock
    }
    func login(completion:@escaping ([Login]) -> (),username:String,Passwors:String) throws {

        let url = URL(string: "http://localhost:8000/api/users/login")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject:[
            "username" : username,
            "password" : Passwors
        ])
        request.timeoutInterval = 60.0
        
        URLSession.shared.dataTask(with: request) {
            
            
                (data: Data?, response: URLResponse?, error: Error?) in
            let response = response as! HTTPURLResponse
               let responseBody = data!
               if !(200...299).contains(response.statusCode) {
                   print(response.statusCode)
                
               
               }
            if let data = String(bytes: responseBody, encoding: .utf8) {
                       // The response body seems to be a valid UTF-8 string, so print that.
                       print(data)
                let login = try! JSONDecoder().decode(Login.self, from: responseBody)
                
                    UserDefaults.standard.set(login.token, forKey: "token")
                   } else {
                       // Otherwise print a hex dump of the body.
                       print(responseBody as NSData)
                   }
            if let Error = error {

                       print("Error took place \(Error)")
                
                       return
                   }
        }
        .resume()
    }

    }

