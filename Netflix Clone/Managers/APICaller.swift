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
    // movie model bata call gareko
    
    //func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
    
    // sabai ko model same vako le yeutai title name gareko model use gareko (Result<[Movie]> lai [Title] model ko name change gareko)
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                
                // model Movie bata gareko
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                
                // Title model bata gareko
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                //completion(.failure(error))
                completion(.failure(APIError.failedTogetData))
//                print("error page")
//                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
                print("error page")
//                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUpcomingMoview(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
                print("error page")
//                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
                print("error page")
//                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))
                print("error page")
//                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getDiscoverMoview(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                //completion(.failure(error))
                completion(.failure(APIError.failedTogetData))
                print("error page")
//                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}







