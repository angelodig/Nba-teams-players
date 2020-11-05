//
//  TeamTableViewCell.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 21/10/2020.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    private let padding: CGFloat = 16
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let conferenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .green
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let divisionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = .blue
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Setup UI
    //Setup views
    private func setupViews() {
        self.contentView.addSubview(fullNameLabel)
        self.contentView.addSubview(cityLabel)
        self.contentView.addSubview(conferenceLabel)
        self.contentView.addSubview(divisionLabel)
    }
    
    //Setup constrains
    private func setupConstrains() {
        ///fullNameLabel
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        ])
        ///cityLabel
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.fullNameLabel.bottomAnchor, constant: padding - 10),
            cityLabel.leadingAnchor.constraint(equalTo: self.fullNameLabel.leadingAnchor),
        ])
        ///divisionLabel
        NSLayoutConstraint.activate([
            divisionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            divisionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            divisionLabel.widthAnchor.constraint(equalToConstant: 80),
            divisionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        ///conferenzeLabel
        NSLayoutConstraint.activate([
            conferenceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            conferenceLabel.trailingAnchor.constraint(equalTo: self.divisionLabel.leadingAnchor, constant: -padding),
            conferenceLabel.widthAnchor.constraint(equalToConstant: 55),
            conferenceLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
