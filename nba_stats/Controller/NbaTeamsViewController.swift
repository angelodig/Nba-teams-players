//
//  ViewController.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 21/10/2020.
//

import UIKit

class NbaTeamsViewController: UIViewController {

    let teamsTableView = UITableView()
    
    var allTeams = DataTeam.init(data: [TeamDetail]()) {
        didSet {
            DispatchQueue.main.async {
                self.teamsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Setup UI
        setupView()
        setupConstraints()
        setupNavigationController()
        
        ///Setup TableView
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
        teamsTableView.register(TeamTableViewCell.self, forCellReuseIdentifier: "cellTeam")
        
        ///Get all Teams
        showSpinnerView(viewForShowSpinner: view)
        getAllTeams()
    }
    
    //MARK: Get All Teams
    private func getAllTeams() {
        let teamsRequest = TeamsRequest.init()
        teamsRequest.getAllTeams { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let allTeamsResponse):
                self?.allTeams.data = allTeamsResponse.data
                //print(allTeamsResponse)
            }
        }
    }

    //MARK: Setup UI
    func setupView() {
        self.view.backgroundColor = .orange
        self.view.addSubview(teamsTableView)
        teamsTableView.backgroundColor = .orange
    }
    
    func setupConstraints() {
        teamsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            teamsTableView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            teamsTableView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            teamsTableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            teamsTableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
    }
    
    func setupNavigationController() {
        navigationItem.title = "Select a Team"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = .orange
        self.navigationController?.navigationBar.isTranslucent = true
    }
}

//MARK: TableView methods
extension NbaTeamsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTeams.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTeam", for: indexPath) as! TeamTableViewCell
        cell.backgroundColor = .orange
        cell.fullNameLabel.text = allTeams.data[indexPath.row].full_name
        cell.cityLabel.text = "City: " + allTeams.data[indexPath.row].city
        cell.conferenceLabel.text = allTeams.data[indexPath.row].conference
        cell.divisionLabel.text = allTeams.data[indexPath.row].division
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = self.teamsTableView.indexPathForSelectedRow else {return}
        let teamSelected = allTeams.data[indexPath.row]
        let playersVC = PlayersViewController()
        playersVC.teamSelected = teamSelected
        
        navigationController?.pushViewController(playersVC, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
