//
//  SearchResponse.swift
//  LongFormTest
//
//  
//

import Foundation

// MARK: - SearchElement
struct SearchResponseData: Codable {
    let error: String?
    let data: SearchResponse?
}

struct SearchResponse: Codable {
    let sf: String?
    let lfs: [LF]?
}

// MARK: - LF
struct LF: Codable {
    let lf: String?
    let freq, since: Int?
    let vars: [LF]?
}

typealias SearchElement = SearchResponseData
typealias SearchResponses = [SearchResponse]
