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
        view.backgroundColor = UIColor(red: 31/255, green: 31/255, blue: 32/255, alpha: 1.0)
        return view
    }()
    
    lazy var contentReleaseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.7
        return view
    }()
    
    lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23/05/24"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 9)
        return label
    }()
    
    lazy var filmNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Furiosa"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var filmImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "furiosa")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(testView)
        testView.addSubview(filmImage)
        filmImage.addSubview(contentReleaseView)
        contentReleaseView.addSubview(releaseLabel)
        testView.addSubview(filmNameLabel)
       
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
            
            filmImage.topAnchor.constraint(equalTo: testView.topAnchor),
            filmImage.leadingAnchor.constraint(equalTo: testView.leadingAnchor),
            filmImage.trailingAnchor.constraint(equalTo: testView.trailingAnchor),
            filmImage.bottomAnchor.constraint(equalTo: testView.bottomAnchor, constant: -20),
            
            contentReleaseView.centerXAnchor.constraint(equalTo: filmImage.centerXAnchor),
            contentReleaseView.bottomAnchor.constraint(equalTo: filmImage.bottomAnchor, constant: -5),
            contentReleaseView.heightAnchor.constraint(equalToConstant: 20),
            contentReleaseView.widthAnchor.constraint(equalToConstant: 55),
            
            releaseLabel.topAnchor.constraint(equalTo: contentReleaseView.topAnchor, constant: 5),
            releaseLabel.bottomAnchor.constraint(equalTo: contentReleaseView.bottomAnchor, constant: -5),
            releaseLabel.centerXAnchor.constraint(equalTo: contentReleaseView.centerXAnchor),
            
            filmNameLabel.bottomAnchor.constraint(equalTo: testView.bottomAnchor),
            filmNameLabel.leadingAnchor.constraint(equalTo: testView.leadingAnchor),
            
            
        ])
    }
}

