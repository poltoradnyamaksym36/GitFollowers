//
//  NetworkManager.swift
//  GitFollowers
//
//  Created by IOS Squad on 26.03.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
            let endpoint = baseUrl + "\(username)/followers?per_page=100\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid requst.Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request.Please check your internet connection.")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid responce from the server. Please try again")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from server was invlaid. Please try again")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received from server was invlaid. Please try again")
            }
        }
        task.resume()
    }
    
}