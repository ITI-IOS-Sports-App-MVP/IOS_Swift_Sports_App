//
//  LeagueDetailsViewController.swift
//  sports_app
//
//  Created by Thaowpsta Saiid on 29/05/2026.
//

import UIKit

class LeagueDetailsViewController: UICollectionViewController {

    enum Section: Int, CaseIterable {
        case upcomingEvents = 0
        case latestResults = 1
        case teams = 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    private func setupCollectionView() {

        collectionView.collectionViewLayout = createCompositionalLayout()

        collectionView.register(
            UINib(nibName: "EventCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "EventCell"
        )
        //        collectionView.register(UINib(nibName: "LatestResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LatestResultCell")
        //        collectionView.register(UINib(nibName: "TeamCircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TeamCircleCell")

        let headerNib = UINib(nibName: "SectionHeaderView", bundle: nil)
        collectionView.register(
            headerNib,
            forSupplementaryViewOfKind: UICollectionView
                .elementKindSectionHeader,
            withReuseIdentifier: "HeaderView"
        )
    }

    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout {
            (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            guard let sectionType = Section(rawValue: sectionIndex) else {
                return nil
            }

            switch sectionType {
            case .upcomingEvents:
                return self.createUpcomingEventsSection()
            case .latestResults:
                return self.createLatestResultsSection()
            case .teams:
                return self.createTeamsSection()
            }
        }
    }

    private func createUpcomingEventsSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.35),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        section.interGroupSpacing = 16

        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 20,
            trailing: 16
        )

        section.boundarySupplementaryItems = [createHeader()]
        return section
    }

    private func createLatestResultsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(140)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 20,
            trailing: 16
        )

        section.boundarySupplementaryItems = [createHeader()]
        return section
    }

    private func createTeamsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(70),
            heightDimension: .absolute(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous  // Free scrolling
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 20,
            trailing: 16
        )

        section.boundarySupplementaryItems = [createHeader()]
        return section
    }

    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(40)
        )
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        guard let sectionType = Section(rawValue: section) else { return 0 }
        switch sectionType {
        case .upcomingEvents: return 3
        case .latestResults: return 4
        case .teams: return 10
        }
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let sectionType = Section(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "EventCell",
            for: indexPath
        )
        return cell

        //        switch sectionType {
        //        case .upcomingEvents:
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath)
        //            return cell
        //
        //        case .latestResults:
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestResultCell", for: indexPath)
        //            return cell
        //
        //        case .teams:
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCircleCell", for: indexPath)
        //            return cell
        //        }
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {

        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        let header =
            collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "HeaderView",
                for: indexPath
            ) as! SectionHeaderView

        guard let sectionType = Section(rawValue: indexPath.section) else {
            return header
        }

        switch sectionType {
        case .upcomingEvents:
            header.titleLabel.text = "UPCOMING EVENTS"
        case .latestResults:
            header.titleLabel.text = "LATEST RESULTS"
        case .teams:
            header.titleLabel.text = "TEAMS"
        }

        return header
    }
}
