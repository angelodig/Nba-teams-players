//
//  TeamsRequest.swift
//  nba_stats
//
//  Created by Angelo Di Gianfilippo on 23/10/2020.
//

import Foundation

class TeamsRequest {

    func getAllTeams(completion: @escaping(Result<DataTeam, Error>) -> Void) {
        let resourceString = "https://rapidapi.p.rapidapi.com/teams?page=0"
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
                    let allTeamsResponse = try decoder.decode(DataTeam.self, from: data!)
                    //print(allTeamsResponse)
                    completion(.success(allTeamsResponse))
                } catch {
                    print("Error response data")
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
    
    
    
}
