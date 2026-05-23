//
//  HomeViewCellViewController.swift
//  Saffara
//
//  Created by Thaowpsta Saiid on 20/05/2026.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: HomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchTextField.textColor = .white
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 13),
            ]
        
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
                string: "Search sports...",
                attributes: placeholderAttributes
            )
        
        presenter = HomePresenter(view: self)
        
        setupCollectionView()
        searchBar.delegate = self
        
        presenter.viewDidLoad()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
            }
}

extension HomeViewController: HomeViewProtocol {
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 16
    
        
        let totalSpacing = padding * 3
        let availableWidth = collectionView.bounds.width - totalSpacing
        
        let cellWidth = availableWidth / 2
        
        let cellHeight = cellWidth * 1.15
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getSportsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCell", for: indexPath) as! HomeCollectionViewCell
        
        let sport = presenter.getSport(at: indexPath.row)
        cell.configure(with: sport)
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            presenter.searchSports(with: searchText)
        }
}
