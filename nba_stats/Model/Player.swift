//
//  Player.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 22/10/2020.
//

import Foundation

struct DataPlayer: Decodable {
    var data: [PlayerInfo]
}

struct PlayerInfo: Decodable {
    var id: Int
    var first_name: String
    var last_name: String
    var position: String?
    var team: Team
    var height_feet: Int?
    var height_inches: Int?
    var weight_pounds: Int?
}

struct Team: Decodable {
    var full_name: String
}
