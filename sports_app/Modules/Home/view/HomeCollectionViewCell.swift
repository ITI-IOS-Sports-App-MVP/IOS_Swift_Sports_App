//
//  HomeCollectionViewCell.swift
//  sports_app
//
//  Created by Thaowpsta Saiid on 23/05/2026.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconBackgroundView: UIView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyling()
    }
    
    private func setupStyling() {
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        iconBackgroundView.layer.cornerRadius = 16
        iconBackgroundView.layer.masksToBounds = true
    }
    
    func configure(with sport: Sport) {
        nameLabel.text = sport.name
        iconLabel.text = sport.icon
        iconBackgroundView.backgroundColor = sport.iconBackgroundColor
    }
}
