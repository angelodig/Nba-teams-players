//
//  PlayersRequest.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 23/10/2020.
//

import Foundation

class PlayerRequest {
    
    func getAllPlayerByTeam(teamSelectedFullName: String, completition: @escaping(Result<[PlayerInfo], Error>) -> Void) {
        var playersList: [PlayerInfo] = []
        
        ///search parameters
        let per_page: Int = 100
        let total_pages = 33
        
        for p in 1...total_pages {
            let resourceString = "https://rapidapi.p.rapidapi.com/players?page=\(p)&per_page=\(per_page)"
            guard let resourceUrl = URL(string: resourceString) else { fatalError() }
            let url: URL = resourceUrl
            
            let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
            
            let apiParameters = ApiParameters.init()
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = apiParameters.headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    //let httpResponse = response as? HTTPURLResponse
                    //print("Response: ", httpResponse!)
                    do {
                        let decoder = JSONDecoder()
                        let playersForPageResponse = try decoder.decode(DataPlayer.self, from: data!)
                        //print("players for page response: ", playersForPageResponse)
                       
                        ///Add player to team list
                        for p in playersForPageResponse.data {
                            if p.team.full_name == teamSelectedFullName {
                                playersList.append(p)
                            }
                        }
                        completition(.success(playersList))
                    } catch {
                        print("Error response data player")
                        print(error)
                        completition(.failure(error))
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}
