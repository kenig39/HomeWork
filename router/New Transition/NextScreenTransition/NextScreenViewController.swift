//
//  NextScreenViewController.swift
//  M23
//
//  Created by Alexander on 12.07.2023.
//

import UIKit

final class NextScreenViewController: UIViewController{
    private let viewModel: NextScreenViewModel
    
    
    init(viewModel: NextScreenViewModel){
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        let dismissButton = UIButton(title: "Dismiss", target: self, selector: #selector(onDismissButton))
        
    }
    
    
   
    
    @objc func onDismissButton(){
        viewModel.dismiss()
    }
    
    
}
