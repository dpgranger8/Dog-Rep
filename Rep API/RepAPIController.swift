//
//  RepAPIController.swift
//  Rep API
//
//  Created by David Granger on 4/24/23.
//

import Foundation

class RepAPIController {
    
    enum FetchItemsError: Error, LocalizedError {
        case invalidStatusCode
    }

    static func fetchItems(matching query: [String: String]) async throws -> [Representative] {
        
        var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_reps_bystate.php?")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }

        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard response is HTTPURLResponse else {
            throw FetchItemsError.invalidStatusCode
        }

        let jsonDecoder = JSONDecoder()
        let searchResponse = try jsonDecoder.decode(SearchResponse.self, from: data)
        
        return searchResponse.results
    }
}
