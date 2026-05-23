//
//  LeaguesViewController.swift
//  sports_app
//
//  Created by Thaowpsta Saiid on 23/05/2026.
//


import UIKit

class LeaguesViewController: UITableViewController, LeaguesViewProtocol {

    // MARK: - MVP Architecture
    var presenter: LeaguesPresenterProtocol!
    
    // UI Elements
    private var activityIndicator = UIActivityIndicatorView(style: .large)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Leagues"
        
        setupTableView()
        setupLoadingIndicator()
        
        presenter.viewDidLoad()
    }
    
    // MARK: - Setup
    private func setupTableView() {
        // UITableViewController automatically sets the delegate and dataSource to `self`.
        
        // Remove default separator lines for the floating card look
        tableView.separatorStyle = .none
        
        // Register the XIB/Nib file
        let cellNib = UINib(nibName: "LeagueTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "LeagueTableViewCell")
    }
    
    private func setupLoadingIndicator() {
        activityIndicator.hidesWhenStopped = true
        
        // In a UITableViewController, it's best to place the activity indicator
        // in the table's backgroundView so it stays centered and doesn't scroll with the cells.
        let backgroundView = UIView(frame: tableView.bounds)
        activityIndicator.center = backgroundView.center
        backgroundView.addSubview(activityIndicator)
        
        tableView.backgroundView = backgroundView
    }
    
    // MARK: - LeaguesViewProtocol (MVP View Methods)
    func showLoadingIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    // MARK: - UITableView Delegate & DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We use optional chaining `?` here just in case the presenter isn't injected yet
        return presenter?.getLeaguesCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell", for: indexPath) as? LeagueTableViewCell else {
            return UITableViewCell()
        }
        
        presenter.configureCell(cell, at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath.row)
    }
}
