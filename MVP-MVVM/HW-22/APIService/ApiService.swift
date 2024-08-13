//
//  ApiService.swift
//  HW-22
//
//  Created by Alexander on 22.05.2023.
//

import Foundation


class ApiCaller{
    static let shared = ApiCaller()

    
    private init(){}

    func fetchFilmSourses(with query: String, complition: @escaping ([ResultsFilm], Error?) -> (Void)) {
        
       
    
        let serchUrl = "https://imdb-api.com/API/SearchMovie/k_9n3c3u15/&q="

        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        
        let urlString = serchUrl + query
        guard let url = URL(string: urlString) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            if error != nil {
                complition([], nil)
            }
            
            else if let data = data{

                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)

                    print("Films:\(result.results.count)")
                    complition(result.results, nil)
                }
                
                catch {
                    complition([], nil)
                }
            }
        }
        task.resume()
    }

   
  }

