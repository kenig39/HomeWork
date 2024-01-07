//
//  NewTransitionModel.swift
//  M23
//
//  Created by Alexander on 10.07.2023.
//

import Foundation

final class NewTransitionModel{
    typealias Routes =  NextScreenTransitionRoute & Closable
    let router: Routes
    
    init(router: Routes) {
        self.router = router
    }
    
    
    func openScreen(){
        router.nextScreenTransition()
    }
    
    func close(){
        router.close()
    }
    
    
}
