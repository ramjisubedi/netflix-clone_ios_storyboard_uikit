//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 02/09/2022.
//

import Foundation

struct Constants {
    static let API_KEY = "23e860a842484b99c79b94b48f7eb44a"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller{
    static let shated = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)")else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
//                print("error page")
//                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
    }
}







