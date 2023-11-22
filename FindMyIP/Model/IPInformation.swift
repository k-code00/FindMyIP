//
//  IPInformation.swift
//  FindMyIP
//
//  Created by Kojo on 21/11/2023.
//

import Foundation

struct IPInformation: Decodable {
    var ip: String?
    var version: String?
    var city: String?
    var region: String?
}
