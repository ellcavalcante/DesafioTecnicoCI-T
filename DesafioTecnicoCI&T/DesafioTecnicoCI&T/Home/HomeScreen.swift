//
//  HomeScreen.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 27/05/24.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionSegment(_ sender: UISegmentedControl)
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 31/255, green: 31/255, blue: 32/255, alpha: 1.0)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Upcoming Movies"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private lazy var mySegmentControl: UISegmentedControl = {
        let segmentBt = UISegmentedControl(items: ["Upcoming", "Popular"])
        segmentBt.translatesAutoresizingMaskIntoConstraints = false
        segmentBt.selectedSegmentIndex = 0
        segmentBt.layer.borderColor = UIColor.white.cgColor
        segmentBt.layer.borderWidth = 2.0
        segmentBt.layer.cornerRadius = 5.0
        segmentBt.clipsToBounds = true
        segmentBt.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
            
        ]
        segmentBt.setTitleTextAttributes(normalAttributes, for: .normal)
        segmentBt.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        return segmentBt
    }()
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        delegate?.actionSegment(sender)
    }
    
    lazy var upcomingCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.delaysContentTouches = false
        
        collection.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.identifier)
        collection.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        collection.backgroundColor = UIColor(red: 31/255, green: 31/255, blue: 32/255, alpha: 1.0)
        return collection
    }()
    
    func configProtocolsStandingCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        upcomingCollection.delegate = delegate
        upcomingCollection.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(backgroundView)
        addSubview(mySegmentControl)
        backgroundView.addSubview(titleLabel)
        addSubview(upcomingCollection)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 170),
            
            mySegmentControl.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            mySegmentControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            
            upcomingCollection.topAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            upcomingCollection.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            upcomingCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            upcomingCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
