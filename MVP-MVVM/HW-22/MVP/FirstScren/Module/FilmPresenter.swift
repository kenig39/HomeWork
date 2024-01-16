//
//  FilmPresenter.swift
//  HW-22
//
//  Created by Alexander on 22.05.2023.
//

import UIKit



protocol FilmsPresenterProtocol: AnyObject {
    
    func setView(_ view:FilmViewControllerProtocol)

    func serchFilmsService(search: String)
    func numberOfRows(in section: Int) -> Int
    func numberOfSection()->Int
    func configureCell(_ cell: FilmsTableViewCell, forRowAt indexPath: IndexPath)
    func didSelectTableViewRowAt(indexPath: IndexPath)
    
}

final class FilmsListPresenter: FilmsPresenterProtocol {
    

    private var view: FilmViewControllerProtocol?
    private var results = [ResultsFilm]()
    
    
    func setView(_ view: FilmViewControllerProtocol) {
        self.view = view
    }
    
  
    func numberOfRows(in section: Int) -> Int {
        return results.count
    }
    
    func numberOfSection()->Int{
        return results.count
    }
    
    func configureCell(_ cell: FilmsTableViewCell, forRowAt indexPath: IndexPath){
        let cellView = results[indexPath.row]
        cell.configure(with: cellView)
    }
    
    
    func serchFilmsService(search: String){
        ApiCaller.shared.fetchFilmSourses(with: search, complition: {[weak self] result, err
            in
            self?.results = result
            DispatchQueue.main.async {
                self?.view?.reloadData()
            }
        })
        
    }
                                          
    func didSelectTableViewRowAt(indexPath: IndexPath) {
        let resultsFilm = results[indexPath.row]

        let vc = SecondScreenViewController()
        vc.initVC(title: resultsFilm.title , description: resultsFilm.description ?? "Nill", image: resultsFilm.image ?? "foto")
        view?.showNextScreen(vc, animated: true)

    }
    
   

}
