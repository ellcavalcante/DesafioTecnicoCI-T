//
//  ViewController.swift
//  DesafioTecnicoCI&T
//
//  Created by Ellington Cavalcante on 27/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    private var selectedSegmentIndex = 0
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configProtocolsStandingCollectionView(delegate: self, dataSource: self)
        screen?.delegate = self
    }
}

extension HomeViewController: HomeScreenProtocol {
    func actionSegment(_ sender: UISegmentedControl) {
            selectedSegmentIndex = sender.selectedSegmentIndex
            screen?.upcomingCollection.reloadData()
            screen?.titleLabel.text = sender.selectedSegmentIndex == 0 ? "Upcoming Movies" : "Popular Movies"
        }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if selectedSegmentIndex == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.identifier, for: indexPath) as? UpcomingCollectionViewCell else {
                    return UICollectionViewCell()
                }
                print("Configuring Upcoming cell at index: \(indexPath.item)")
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else {
                    return UICollectionViewCell()
                }
                print("Configuring Popular cell at index: \(indexPath.item)")
                return cell
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC: DetailsViewController = DetailsViewController()
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}



