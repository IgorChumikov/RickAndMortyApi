//
//  Networking.swift
//  RickAndMortyApi
//
//  Created by Игорь Чумиков on 26.09.2021.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Character) -> Void) {
        
        guard  let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "no description")
                return
            }
            do {
                let result = try! JSONDecoder().decode(Character.self, from: data)
                print(result)
                
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}




