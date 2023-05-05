//
//  DogAPIController.swift
//  Rep API
//
//  Created by David Granger on 4/24/23.
//

import Foundation

class DogAPIController {
    
    enum FetchItemsError: Error, LocalizedError {
        case invalidStatusCode
    }

    static func fetchItems() async throws -> URL {
        
        var urlComponents = URLComponents(string: "https://dog.ceo/api/breeds/image/random")!

        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard response is HTTPURLResponse else {
            throw FetchItemsError.invalidStatusCode
        }
        
        let jsonDecoder = JSONDecoder()
        let searchResponse = try jsonDecoder.decode(Dog.self, from: data)
        
        return searchResponse.message
    }
}
