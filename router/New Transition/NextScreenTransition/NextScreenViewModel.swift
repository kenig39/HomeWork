//
//  File.swift
//  M23
//
//  Created by Alexander on 12.07.2023.
//

import Foundation


final class NextScreenViewModel{
    typealias Routes = Closable & NextScreenTransitionRoute
    let router: Routes
    
    init(router: Routes){
        self.router = router
    }
    
    func dismiss(){
        router.close()
    }
    
    func transition(){
        router.nextScreenTransition()
    }
    
}
