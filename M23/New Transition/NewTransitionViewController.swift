//
//  NewTransitionViewController.swift
//  M23
//
//  Created by Alexander on 10.07.2023.
//

import UIKit

final class NewTransitionViewController: UIViewController {
    private let viewModel: NewTransitionModel
    
    
    init(viewModel: NewTransitionModel) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Transition"
        
        let loginButton = UIButton(title: "Forward", target: self, selector: #selector(onLoginButton))
        let itemButton = UIButton(title: "Back", target: self, selector: #selector(onItemButton))
        
        let vStack = UIStackView(arrangedSubviews: [loginButton, itemButton])
        addStackView(vStack: vStack)
    }

    @objc
    private func onItemButton() {
        viewModel.openScreen()
    }

    @objc
    private func onLoginButton() {
        viewModel.close()
    }
}


        
    

