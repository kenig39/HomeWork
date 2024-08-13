//
//  FilmListViewModel.swift
//  HW-22
//
//  Created by Alexander on 21.06.2023.
//

import UIKit

final class FilmListViewModel: UIViewController {
  
    
    private var tableView = UITableView()
    private var serchBarController = UISearchController(searchResultsController: nil)
    private var viewModel: FilmViewModelProtocol = FilmListView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateView = {[weak self] in
            self?.tableView.reloadData()
        }
        setupTable()
        serchBar()
      }
    
    
    private func setupTable(){
        self.view.addSubview(tableView)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.registerCell(cell: FilmCellModel.self)
        self.tableView.frame = view.frame
    
    }
    
    func serchBar(){
        navigationItem.searchController = serchBarController
        serchBarController.searchBar.delegate = self
    }
    
    
}

extension FilmListViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return viewModel.numberOfSection
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection(section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeue(FilmCellModel.self) else {
             fatalError()
        }
        
        viewModel.configureCell(cell, forRowAt: indexPath)
        
        return cell
    }
   
  
}

extension FilmListViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didselectTableViewRow(at: indexPath, animated: true)
    }
}

extension FilmListViewModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text, !text.isEmpty else {return}
        DispatchQueue.main.async {
            self.viewModel.fetchRequest(text: text)
        }
          
       
    }
}
