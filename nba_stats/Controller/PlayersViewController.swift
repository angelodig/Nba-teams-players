//
//  PlayersViewController.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 22/10/2020.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDelegate {

    let playersTableView = UITableView()
    
    var teamSelected: TeamDetail?
    
    var playersToShow = [PlayerInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.playersTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Setup UI
        setupView()
        setupConstraintsTableView()
        setupNavigationController()
        
        ///Setup TableView
        playersTableView.dataSource = self
        playersTableView.delegate = self
        playersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "playerCell")
        
        showSpinnerView(viewForShowSpinner: view)
        getAllPlayersForTeam()
    }
    
    //MARK: Get players
    func getAllPlayersForTeam() {
        let playersRequest = PlayerRequest.init()
        playersRequest.getAllPlayerByTeam(teamSelectedFullName: teamSelected?.full_name ?? "") { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let allPlayersForTeamResponse):
                self?.playersToShow = allPlayersForTeamResponse
                //print(allPlayersForTeamResponse)
            }
        }
    }
        
    //MARK: Setup UI
    func setupView() {
        self.view.backgroundColor = .orange
        self.view.addSubview(playersTableView)
        playersTableView.backgroundColor = .orange
    }
    
    func setupConstraintsTableView() {
        playersTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            playersTableView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            playersTableView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            playersTableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            playersTableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
    }
    
    func setupNavigationController() {
        navigationItem.title = "\(teamSelected!.abbreviation) - Select Player:"
        self.navigationController?.navigationBar.isTranslucent = true
    }

}

extension PlayersViewController: UITableViewDataSource, UITextViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.init(playersToShow).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        cell.backgroundColor = .orange
        cell.textLabel?.text = playersToShow[indexPath.row].first_name + " " +  playersToShow[indexPath.row].last_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = self.playersTableView.indexPathForSelectedRow else { return }
        let playerSelected = playersToShow[indexPath.row]
        
        let playerStatsVC = PlalyerStatsViewController()
        playerStatsVC.playerSelectedInfo = playerSelected
        
        navigationController?.pushViewController(playerStatsVC, animated: true)
    }
    
}
