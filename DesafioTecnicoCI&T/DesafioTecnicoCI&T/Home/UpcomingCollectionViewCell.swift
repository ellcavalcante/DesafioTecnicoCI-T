//
//  UpcomingCollectionViewCell.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 03/06/24.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: UpcomingCollectionViewCell.self)
    
    private lazy var testView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var nameImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "furiosa")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(testView)
        testView.addSubview(nameImage)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            testView.topAnchor.constraint(equalTo: contentView.topAnchor),
            testView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            testView.heightAnchor.constraint(equalToConstant: 200),
//            testView.widthAnchor.constraint(equalToConstant: 150),
            
            nameImage.topAnchor.constraint(equalTo: testView.topAnchor),
            nameImage.leadingAnchor.constraint(equalTo: testView.leadingAnchor),
            nameImage.trailingAnchor.constraint(equalTo: testView.trailingAnchor),
            nameImage.bottomAnchor.constraint(equalTo: testView.bottomAnchor, constant: -20)
        ])
    }
}

