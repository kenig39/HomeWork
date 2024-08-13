//
//  SecondScreenViewController.swift
//  HW-22
//
//  Created by Alexander on 16.06.2023.
//

import UIKit
import SnapKit


class SecondScreenViewController: UIViewController {
    
    var descriptionFilm: String?
    var titleFilm = ""
    var imageFilm: String?
    
    func initVC(title: String,description: String, image: String){
        self.titleFilm = title
        self.descriptionFilm = description
        self.imageFilm = image
    }
    
    var filmTitle = UILabel()
    var aboutFilm = UILabel()
    var imageUrl = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        constraints()
        
    }
    
    
    func setup(){
        filmTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        filmTitle.text = titleFilm
        filmTitle.numberOfLines = 0
        
        aboutFilm.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        aboutFilm.text = descriptionFilm
        aboutFilm.numberOfLines = 0
        
        imageUrl.contentMode = .scaleAspectFill
        imageUrl.layer.cornerRadius = 20
        if let loadImage = imageFilm{
            imageUrl.load(url: loadImage)
            
            view.addSubviews([filmTitle, aboutFilm, imageUrl])
        }
        
    }
    
    func constraints(){
        imageUrl.snp.makeConstraints { make in
            make.top.equalTo(view).offset(130)
            make.left.equalTo(view).offset(120)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
        filmTitle.snp.makeConstraints { make in
            make.top.equalTo(imageUrl.snp.bottom).offset(50)
            make.left.equalTo(imageUrl.snp.left).offset(10)
            make.size.equalTo(CGSize(width: 300, height: 100))
        }
        
        aboutFilm.snp.makeConstraints { make in
            make.top.equalTo(filmTitle.snp.bottom).offset(10)
            make.left.equalTo(view).offset(30)
            make.size.equalTo(CGSize(width: 300, height: 100))
        }
    }
    
}
