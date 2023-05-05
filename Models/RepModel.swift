//
//  RepModel.swift
//  Rep API
//
//  Created by David Granger on 4/24/23.
//

import Foundation

struct Representative: Codable {
    var name: String
    var party: String
    var state: String
    var district: String
    var phone: String
    var office: String
    var link: String
}

struct SearchResponse: Codable {
    let results: [Representative]
}
