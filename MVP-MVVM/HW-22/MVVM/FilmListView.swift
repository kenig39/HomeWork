//
//  FilmListView.swift
//  
//
//  Created by Alexander on 21.06.2023.
//

import Foundation


class FilmListView: FilmViewModelProtocol {
   
    
    lazy var results = [ResultsFilm]()
    
    

    var numberOfSection: Int {
        return results.count
    }
    
    
   lazy var numberOfRowInSection: (Int) -> Int = getNumberOfRows
    
    var updateView: (() -> Void)?
    
    
    
   private func getNumberOfRows(_ section: Int)-> Int{
        return results.count
    }
    
    
    func configureCell(_ cell: FilmCellModel, forRowAt indexPath: IndexPath){
        let cellView = results[indexPath.row]
        cell.configure(with: cellView)
    }
    
    
    func fetchRequest(text: String) {
        ApiCaller.shared.fetchFilmSourses(with: text, complition: { [weak self] result, err in 
            self?.results = result
          
        })
    }
    
    
  
    func didselectTableViewRow(at indexPath: IndexPath, animated: Bool) {
        let resultFilm = results[indexPath.row]
        
        let vc = SecondScreenViewController()
        vc.initVC(title: resultFilm.title, description: resultFilm.description ?? "Descript", image: resultFilm.image ?? "Foto")
    }
    
    
    
}
