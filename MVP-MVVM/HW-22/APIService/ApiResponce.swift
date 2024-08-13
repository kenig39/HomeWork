//
//  ApiResponce.swift
//  HW-22
//
//  Created by Alexander on 22.05.2023.
//

import Foundation


struct APIResponse: Codable {
    let results: [ResultsFilm]
}

struct ResultsFilm: Codable {
    
    let image: String?
    let title: String
    let description: String?
  
   }

