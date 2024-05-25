//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Fadil Kurniawan on 25/05/24.
//

import Foundation

class NetworkManager : ObservableObject{
    
    let baseUrl = "https://hn.algolia.com/api/v1/"
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "\(baseUrl)search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ data, resp, error in
                if error == nil {
                    let dec = JSONDecoder()
                    if let safeData = data{
                        do{
                            let res = try dec.decode(Results.self, from: safeData)
                            DispatchQueue.main.async{
                                self.posts = res.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }else{
                    print(error ?? "Unknown Err")
                }
            }
            task.resume()
        }
    }
}
