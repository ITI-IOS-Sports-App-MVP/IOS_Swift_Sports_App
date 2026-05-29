//
//  LatestResultCollectionViewCell.swift
//  sports_app
//
//  Created by Thaowpsta Saiid on 29/05/2026.
//

import UIKit

class LatestResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
        
        @IBOutlet weak var homeTeamImageView: UIImageView!
        @IBOutlet weak var homeTeamNameLabel: UILabel!
        @IBOutlet weak var homeScoreLabel: UILabel!
        @IBOutlet weak var awayTeamImageView: UIImageView!
        @IBOutlet weak var awayTeamNameLabel: UILabel!
        @IBOutlet weak var awayScoreLabel: UILabel!
        
        @IBOutlet weak var matchStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        homeTeamImageView.layer.cornerRadius = homeTeamImageView.frame.height / 2
        awayTeamImageView.layer.cornerRadius = awayTeamImageView.frame.height / 2
    }

    func configure(homeName: String, homeScore: String, awayName: String, awayScore: String, status: String) {
            homeTeamNameLabel.text = homeName
            homeScoreLabel.text = homeScore
            awayTeamNameLabel.text = awayName
            awayScoreLabel.text = awayScore
            matchStatusLabel.text = status
        }
}
