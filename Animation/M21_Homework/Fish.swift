//
//  Fish.swift
//  M21_Homework
//
//  Created by Alexander on 27.01.2023.
//

import UIKit


class Fish: UIViewController {
    
    
  

    lazy var fish: UIImageView = {
        let image = UIImage(named: "fish")
        let view = UIImageView(image: image)
        view.frame = CGRect( x: 0, y: 0, width: 200, height: 200)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var fish1: UIImageView = {
        let image = UIImage(named: "fish")
        let view = UIImageView(image: image)
        view.frame = CGRect( x: 0, y: 0, width: 200, height: 200)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var fish2: UIImageView = {
        let image = UIImage(named: "fish")
        let view = UIImageView(image: image)
        view.frame = CGRect( x: 0, y: 0, width: 200, height: 200)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var fish3: UIImageView = {
        let image = UIImage(named: "fish")
        let view = UIImageView(image: image)
        view.frame = CGRect( x: 0, y: 0, width: 200, height: 200)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var fish4: UIImageView = {
        let image = UIImage(named: "fish")
        let view = UIImageView(image: image)
        view.frame = CGRect( x: 0, y: 0, width: 200, height: 200)
        view.contentMode = .scaleAspectFit
        return view
    }()
   
    
}
