//
//  NewTransitionRoute.swift
//  M23
//
//  Created by Alexander on 10.07.2023.
//

import UIKit

protocol NewTransitionRoute{
    func newTransition() -> UIViewController
}


extension NewTransitionRoute where Self: Router{
    func newTransition() -> UIViewController{
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewModel = NewTransitionModel(router: router)
        let viewController = NewTransitionViewController(viewModel: viewModel)
        router.root = viewController
        
        
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.tabBarItem = UITabBarItem(title: "Transition ", image: nil, tag: 0)
        return navigation
    }
    
    func selectListTabs(){
        root?.tabBarController?.selectedIndex = 1
    }
    
}

extension DefaultRouter: NewTransitionRoute{}
