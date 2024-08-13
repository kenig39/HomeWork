//
//  Extentions.swift
//  HW-22
//
//  Created by Alexander on 22.05.2023.
//

import UIKit

protocol TableViewCellType {
  static var identifier: String { get }
}

extension UITableViewCell: TableViewCellType {
  static var identifier: String { return String(describing: self.self) }
}

extension UITableView {
  func registerCell<Cell>(
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.identifier
    ) where Cell: UITableViewCell {
    register(cell, forCellReuseIdentifier: reuseIdentifier)
  }
  
  func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell? where Cell: UITableViewCell {
    return dequeueReusableCell(withIdentifier: reusableCell.identifier) as? Cell
  }
}


extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIImageView {
    func load(url: String) {
        guard let imageURL = URL(string: url) else {return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


