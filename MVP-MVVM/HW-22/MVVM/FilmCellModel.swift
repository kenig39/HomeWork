//
//  FilmCellModel.swift
//  HW-22
//
//  Created by Alexander on 18.06.2023.
//

import UIKit
import SnapKit


final class FilmCellModel: UITableViewCell{
    
    private let titleLabel = UILabel()
    private let descriptionLable = UILabel()
    private let imageFilmUrl = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        titleLabel.textColor = .black

        descriptionLable.numberOfLines = 0
        descriptionLable.font = .systemFont(ofSize: 17, weight: .regular)
        descriptionLable.textColor = .black

        imageFilmUrl.layer.cornerRadius = 16
        imageFilmUrl.layer.masksToBounds = true
        imageFilmUrl.clipsToBounds = true
        imageFilmUrl.contentMode = .scaleAspectFit


        contentView.addSubviews([titleLabel, descriptionLable, imageFilmUrl])
    }

    private func constraintsCell(){
    
        imageFilmUrl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(10)
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(imageFilmUrl.snp.right).offset(10)
        
        }
        descriptionLable.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: 250, height: 100))
        }
       
    }

    func configure(with viewModel: ResultsFilm) {
        titleLabel.text = viewModel.title
        descriptionLable.text = viewModel.description
        
        if let loadImage = viewModel.image {
            imageFilmUrl.load(url: loadImage)
        }
       
    }
    
}
