//
//  PopularViewController.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 28/05/24.
//

import UIKit

class PopularViewController: UIViewController {
    
    var screen: PopularScreen?

    override func loadView() {
        screen = PopularScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
