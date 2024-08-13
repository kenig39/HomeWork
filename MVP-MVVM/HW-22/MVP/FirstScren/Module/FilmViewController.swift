//
//  FilmViewController.swift
//  HW-22
//
//  Created by Alexander on 22.05.2023.
//
import UIKit

protocol FilmViewControllerProtocol {
 
    func createSearchBar()
    func reloadData()
    func showNextScreen(_ viewController: UIViewController, animated: Bool)
}

class FilmViewController: UIViewController {
    
    
    private let tableView = UITableView()
    private let serchBar = UISearchController(searchResultsController: nil)
    private let presenter: FilmsPresenterProtocol = FilmsListPresenter()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }

    
       override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setView(self)
        setupTable()
        createSearchBar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }


        func setupTable(){
            self.view.addSubview(tableView)
                 self.tableView.dataSource = self
                   self.tableView.delegate = self
                    self.tableView.registerCell(cell: FilmsTableViewCell.self)
                      self.tableView.frame = view.frame
    }
 
    
}


extension FilmViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSection()
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeue(FilmsTableViewCell.self) else {
            fatalError()
        }
        presenter.configureCell(cell, forRowAt: indexPath)
        
        return cell
    }

}

extension FilmViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectTableViewRowAt(indexPath: indexPath)
    }
    
}

extension FilmViewController: UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let texts = searchBar.text, !texts.isEmpty else {return}
                presenter.serchFilmsService(search: texts)
    }
}

extension FilmViewController: FilmViewControllerProtocol {
    
    func createSearchBar(){
        navigationItem.searchController = serchBar
        serchBar.searchBar.delegate = self
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func showNextScreen(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: true)
    }

}
