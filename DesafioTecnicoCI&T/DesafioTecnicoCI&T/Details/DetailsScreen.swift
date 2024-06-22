//
//  PopularScreen.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 28/05/24.
//

import UIKit

protocol DetailsScreenProtocol {
    func actionBackButton()
}

class DetailsScreen: UIView {
    
    var delegate: DetailsScreenProtocol?
    
    private lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        bButton.tintColor = .white
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    private lazy var filmView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1.0)
        return view
    }()
    
    private lazy var filmImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "furiosadetails")
        return img
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Furiosa"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var dateReleaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2024"
        label.textColor = UIColor(red: 170/255, green: 167/255, blue: 168/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var timeAndCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "148m | Action, Adventure, Science fiction"
        label.textColor = UIColor(red: 170/255, green: 167/255, blue: 168/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var actorsAndDescriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "backgroundDetails2")
        return view
    }()
    
    private lazy var imageActorsStackView: UIStackView = {
        let stackV = UIStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.backgroundColor = UIColor(named: "backgroundDetails2")
        stackV.axis = .horizontal
        stackV.alignment = .fill
        stackV.distribution = .fillEqually
        stackV.spacing = 10
        return stackV
    }()
    
    private func configureStackView() {
        
        imageActorsStackView.addArrangedSubview(actor1Image)
        imageActorsStackView.addArrangedSubview(actor2Image)
        imageActorsStackView.addArrangedSubview(actor3Image)

    }
    
    private lazy var actor1Image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "anya")
        return img
    }()
    
    private lazy var actor2Image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "chris")
        return img
    }()
    
    private lazy var actor3Image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "nicholas")
        return img
    }()
    
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 170/255, green: 167/255, blue: 168/255, alpha: 1.0)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A jovem Furiosa cai nas mãos de uma grande horda de motoqueiros liderada pelo senhor da guerra Dementus. Varrendo Wasteland, eles encontram a Cidadela, presidida pelo Immortan Joe. Enquanto os dois tiranos lutam pelo domínio, Furiosa logo se vê em uma batalha ininterrupta para voltar para casa."
        label.textColor = UIColor(red: 170/255, green: 167/255, blue: 168/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor()
        setUpConstraints()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(filmView)
        filmView.addSubview(filmImage)
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(dateReleaseLabel)
        addSubview(timeAndCategoryLabel)
        addSubview(actorsAndDescriptionView)
        actorsAndDescriptionView.addSubview(imageActorsStackView)
        actorsAndDescriptionView.addSubview(lineLabel)
        actorsAndDescriptionView.addSubview(descriptionLabel)
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            filmView.topAnchor.constraint(equalTo: topAnchor),
            filmView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            filmView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            filmView.heightAnchor.constraint(equalToConstant: 300),
            
            filmImage.topAnchor.constraint(equalTo: filmView.topAnchor),
            filmImage.leadingAnchor.constraint(equalTo: filmView.leadingAnchor),
            filmImage.trailingAnchor.constraint(equalTo: filmView.trailingAnchor),
            filmImage.bottomAnchor.constraint(equalTo: filmView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: filmView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            dateReleaseLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 3),
            dateReleaseLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15),
            
            timeAndCategoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            timeAndCategoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            actorsAndDescriptionView.topAnchor.constraint(equalTo: timeAndCategoryLabel.bottomAnchor, constant: 15),
            actorsAndDescriptionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            actorsAndDescriptionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            actorsAndDescriptionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageActorsStackView.topAnchor.constraint(equalTo: actorsAndDescriptionView.topAnchor, constant: 10),
            imageActorsStackView.leadingAnchor.constraint(equalTo: actorsAndDescriptionView.leadingAnchor, constant: 10),
            imageActorsStackView.trailingAnchor.constraint(equalTo: actorsAndDescriptionView.trailingAnchor, constant: -10),
            imageActorsStackView.heightAnchor.constraint(equalToConstant: 200),
            
            lineLabel.topAnchor.constraint(equalTo: imageActorsStackView.bottomAnchor, constant: 15),
            lineLabel.leadingAnchor.constraint(equalTo: actorsAndDescriptionView.leadingAnchor, constant: 10),
            lineLabel.trailingAnchor.constraint(equalTo: actorsAndDescriptionView.trailingAnchor, constant: -10),
            lineLabel.heightAnchor.constraint(equalToConstant: 0.3),
            
            descriptionLabel.topAnchor.constraint(equalTo: lineLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: actorsAndDescriptionView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: actorsAndDescriptionView.trailingAnchor, constant: -10),
            
        ])
    }
}
