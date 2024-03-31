//
//  Utils.swift
//  LearningUIKit
//
//  Created by Ritesh Yadav on 27/03/24.
//

import Foundation

let apiKey = "your api key"

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
