//
//  PopularViewController.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 28/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var screen: DetailsScreen?

    override func loadView() {
        screen = DetailsScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension DetailsViewController: DetailsScreenProtocol {
    func actionBackButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
