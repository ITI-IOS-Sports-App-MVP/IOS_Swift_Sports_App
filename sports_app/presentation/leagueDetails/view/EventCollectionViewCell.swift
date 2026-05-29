//
//  EventCollectionViewCell.swift
//  sports_app
//
//  Created by Thaowpsta Saiid on 29/05/2026.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var matchNameLabel: UILabel!
    @IBOutlet weak var matchDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        homeTeamImageView.layer.cornerRadius =
            homeTeamImageView.frame.height / 2
        awayTeamImageView.layer.cornerRadius =
            awayTeamImageView.frame.height / 2
    }

    func configure(
        homeImage: String,
        awayImage: String,
        name: String,
        date: String
    ) {
        matchNameLabel.text = name
        matchDateLabel.text = date
        homeTeamImageView.image = UIImage(systemName: "sportscourt.fill")
        awayTeamImageView.image = UIImage(systemName: "sportscourt.fill")
    }
}
