//
//  NetworkManager.swift
//  MovieDatabaseURLSession
//
//  Created by Иван on 9/9/21.
//

import Foundation


class NetworkManager {
    
    var dataTask: URLSessionTask?
    
    func makeSearchRequest(completion: @escaping (MoviesData) -> Void) {
        
        let topRatedMoviesUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=263ac10e91d4174948c7f03a3f8d9f02&language=en-US&page=1"
        
        guard let url = URL(string: topRatedMoviesUrl) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Data task error - \(error)")
            }
            
            if let response = response {
                print("Data task response - \(response)")
            }
            
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let value = try jsonDecoder.decode(MoviesData.self, from: data)
                    completion(value)
                } catch let error {
                    print("Pasrsing error - \(error)")
                }
            }
        }
        dataTask?.resume()
    }
    
    func fetchImageForCell(url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Data task error - \(error)")
            }
            
            if let response = response {
                print("Data task response - \(response)")
            }
            
            if let data = data {
                completion(data)
            }
        }
        dataTask?.resume()
    }
}
