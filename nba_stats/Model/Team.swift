//
//  Team.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 21/10/2020.
//

import Foundation
import UIKit

struct DataTeam: Decodable {
    var data: [TeamDetail]
}

struct TeamDetail: Decodable {
    var id: Int
    var full_name: String
    var abbreviation: String
    var city: String
    var conference: String
    var division: String
}
