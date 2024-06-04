//
//  PopularCollectionViewCell.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 03/06/24.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: PopularCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColor() {
        backgroundColor = .blue
    }
}
