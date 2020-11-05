//
//  PlalyerStatsViewController.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 22/10/2020.
//

import UIKit

class PlalyerStatsViewController: UIViewController {

    var playerSelectedInfo: PlayerInfo?
    
    lazy var playerInfoView: PlayerInfoView = {
        let infoView = PlayerInfoView(playerSelected: playerSelectedInfo!)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ///Setup UI
        setupView()
        setupConstrains()
        setupNavigationController()
    }
    
    //MARK: Setup UI
    private func setupView() {
        view.addSubview(playerInfoView)
        self.view.backgroundColor = .orange
    }
    
    private func setupConstrains() {
        playerInfoView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            playerInfoView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            playerInfoView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            playerInfoView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            playerInfoView.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
    }
    
    private func setupNavigationController() {
        navigationItem.title = "You chose:"
        self.navigationController?.navigationBar.isTranslucent = true
    }

}
