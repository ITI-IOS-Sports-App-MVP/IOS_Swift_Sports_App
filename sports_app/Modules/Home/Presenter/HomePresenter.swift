//
//  HomeViewProtocol.swift
//  sports_app
//
//  Created by Thaowpsta Saiid on 23/05/2026.
//


import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    func reloadCollectionView()
}

class HomePresenter {
    
    private weak var view: HomeViewProtocol?
    
    private var sports: [Sport] = []
    private var filteredSports: [Sport] = []
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        fetchSportsData()
    }
    
    private func fetchSportsData() {
        sports = [
            Sport(name: "Soccer", icon: "⚽️", iconBackgroundColor: UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 1.0)),
            Sport(name: "Basketball", icon: "🏀", iconBackgroundColor: UIColor(red: 0.3, green: 0.1, blue: 0.1, alpha: 1.0)),
            Sport(name: "Tennis", icon: "🎾", iconBackgroundColor: UIColor(red: 0.1, green: 0.2, blue: 0.1, alpha: 1.0)),
            Sport(name: "American Football", icon: "🏈", iconBackgroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.1, alpha: 1.0))
        ]
        filteredSports = sports
        view?.reloadCollectionView()
    }
    
    
    func getSportsCount() -> Int {
        return filteredSports.count
    }
    
    func getSport(at index: Int) -> Sport {
        return filteredSports[index]
    }
        
    func searchSports(with query: String) {
        if query.isEmpty {
            filteredSports = sports
        } else {
            filteredSports = sports.filter { $0.name.localizedCaseInsensitiveContains(query) }
        }
        view?.reloadCollectionView()
    }
}
