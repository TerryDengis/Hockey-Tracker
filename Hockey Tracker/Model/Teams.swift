//
//  NHL Teams.swift
//  NHL Game Tracker
//
//  Created by Terry Dengis on 1/7/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import Foundation

struct NHLTeams: Codable {
    let copyright: String
    let teams: [LeagueTeam]
}

struct LeagueTeam: Codable {
    let id: Int
    let name: String
    let link: String
    let venue: Venue
    let abbreviation: String
    let teamName: String
    let locationName: String
    let firstYearOfPlay: String?
    let division: Division
    let conference: Conference
    let franchise: Franchise
    let shortName: String
    let officialSiteUrl: String
    let franchiseId: Int
    let active: Bool
}

struct Conference: Codable {
    let id: Int
    let name: String // ConferenceName
    let link: String // ConferenceLink
}

struct Division: Codable {
    let id: Int
    let name: String // DivisionName
    let nameShort: String // NameShort
    let link: String // DivisionLink
    let abbreviation: String //Abbreviation
}

struct Franchise: Codable {
    let franchiseId: Int
    let teamName, link: String
}

struct Venue: Codable {
    let name: String
    let link: String
    let city: String
    let timeZone: TimeZone
    let id: Int?
}

struct TimeZone: Codable {
    let id: String
    let offset: Int
    let tz: TimeZoneCode
}

