//
//  FilmViewModelProtocol.swift
//  HW-22
//
//  Created by Alexander on 18.06.2023.
//

import Foundation


protocol FilmViewModelProtocol{
    
    var numberOfSection: Int {get}
    
    var numberOfRowInSection: (_ section: Int) -> Int {get}
    
    var updateView: (()-> Void)? {get set}
    
    func configureCell(_ cell: FilmCellModel, forRowAt indexPath: IndexPath)
    
    func didselectTableViewRow(at indexPath: IndexPath, animated: Bool)
    
    func fetchRequest(text: String)
    
    
    
    
}
