//
//  PlayerInfoView.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 22/10/2020.
//

import UIKit

final class PlayerInfoView: UIView {
    
    private let padding: CGFloat = 15
     
    private lazy var firstAndLastNameLbl: UILabel = {
        return genericLabel(size: 25)
    }()
    
    private lazy var teamLbl: UILabel = {
        return genericLabel(size: 20)
    }()
    
    private lazy var positionlbl: UILabel = {
       return genericLabel(size: 18)
    }()
    
    private lazy var heightLbl: UILabel = {
        return genericLabel(size: 18)
    }()
    
    private lazy var weightLbl: UILabel = {
        return genericLabel(size: 18)
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraintsViews()
    }
    
    public convenience init(playerSelected: PlayerInfo) {
        self.init(frame: .zero)
        configurePlayerLabels(playerSelected: playerSelected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubviews(firstAndLastNameLbl, teamLbl, positionlbl, heightLbl, weightLbl)
        self.backgroundColor = .orange
    }
    
    private func setupConstraintsViews() {
        NSLayoutConstraint.activate([
            firstAndLastNameLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            firstAndLastNameLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
        ])
        
        NSLayoutConstraint.activate([
            teamLbl.topAnchor.constraint(equalTo: firstAndLastNameLbl.bottomAnchor, constant: padding),
            teamLbl.leadingAnchor.constraint(equalTo: firstAndLastNameLbl.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            positionlbl.topAnchor.constraint(equalTo: teamLbl.bottomAnchor, constant: padding),
            positionlbl.leadingAnchor.constraint(equalTo: firstAndLastNameLbl.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heightLbl.topAnchor.constraint(equalTo: positionlbl.bottomAnchor, constant: padding),
            heightLbl.leadingAnchor.constraint(equalTo: firstAndLastNameLbl.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            weightLbl.topAnchor.constraint(equalTo: heightLbl.bottomAnchor, constant: padding),
            weightLbl.leadingAnchor.constraint(equalTo: firstAndLastNameLbl.leadingAnchor)
        ])
    }
    
    public func configurePlayerLabels(playerSelected: PlayerInfo) {
        firstAndLastNameLbl.text = playerSelected.first_name + " " + playerSelected.last_name
        teamLbl.text = playerSelected.team.full_name
        positionlbl.text = "Position: \(playerSelected.position ?? "unkown")"
        heightLbl.text = (playerSelected.height_feet != nil && playerSelected.height_inches != nil) ? "Height: \(playerSelected.height_feet!)'\(playerSelected.height_inches!)''" : ""
        weightLbl.text = ((playerSelected.weight_pounds) != nil) ? "Weight: \(playerSelected.weight_pounds!)lb" : ""
    }
    
    private func genericLabel(size: CGFloat) -> UILabel {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: size)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
}
