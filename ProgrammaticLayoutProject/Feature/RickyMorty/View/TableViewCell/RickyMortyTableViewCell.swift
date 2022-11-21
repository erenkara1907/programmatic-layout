//
//  RickyMortyTableViewCell.swift
//  ProgrammaticLayoutProject
//
//  Created by Eren Kara on 21.11.2022.
//

import UIKit
import AlamofireImage

class RickyMortyTableViewCell: UITableViewCell {
    
    private let customImage: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    
    private lazy var randomImage: String = "https://picsum.photos/200/300"
    
    enum Identifier: String {
        case custom = "eren"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(customImage)
        addSubview(title)
        addSubview(customDescription)
        
        title.font = .boldSystemFont(ofSize: 18.0)
        customDescription.font = .italicSystemFont(ofSize: 10.0)
        
        customImage.snp.makeConstraints { make in
            make.height.equalTo(100.0)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.bottom).offset(10.0)
            make.right.left.equalTo(contentView)
        }
        
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(title.snp.top).offset(5.0)
            make.right.left.equalTo(title)
            make.bottom.equalToSuperview()
        }
    }
    
    func saveModel(model: Result) {
        title.text = model.name
        customDescription.text = model.status
        customImage.af.setImage(withURL: URL(string: model.image ?? "") ?? URL(string: randomImage)!)
    }
}
