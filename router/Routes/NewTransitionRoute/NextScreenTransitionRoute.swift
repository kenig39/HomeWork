//
//  NextScreentransitionRoute.swift
//  M23
//
//  Created by Alexander on 12.07.2023.
//

import UIKit


protocol NextScreenTransitionRoute{
    func nextScreenTransition()
}

extension NextScreenTransitionRoute where Self: Router{
    func nextScreenTransition(with transition: Transition){
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = NextScreenViewModel(router: router)
        let viewController = NextScreenViewController(viewModel: viewModel)
        let navigationControler = UINavigationController(rootViewController: viewController)
        router.root = viewController
        
        
        route(to: navigationControler, as: transition)
    }
    
    func nextScreenTransition(){
        nextScreenTransition(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
    
}

extension DefaultRouter: NextScreenTransitionRoute{}
