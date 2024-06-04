//
//  PopularScreen.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 28/05/24.
//

import UIKit

class PopularScreen: UIView {

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
