//
//  Constants.swift
//  NHL Game Tracker
//
//  Created by Terry Dengis on 1/1/19.
//  Copyright © 2019 Terry Dengis. All rights reserved.
//

import SwiftUI

let domainUrl = "https://statsapi.web.nhl.com"

let scheduleUrl = domainUrl + "/api/v1/schedule?date="
let lineScoreUrl = domainUrl + "/api/v1/game/"

// Configuration EndPoints
let configurationsUrl = domainUrl + "/api/v1/configurations"
let languagesUrl = domainUrl + "/api/v1/languages"
let gameTypesUrl = domainUrl + "/api/v1/gameTypes"
let Url = domainUrl + "/api/v1/statTypes"
let playerStatusUrl = domainUrl + "/api/v1/playerStatus"
let standingsTypeUrl = domainUrl + "/api/v1/standingsTypes"
let expandsUrl = domainUrl + "/api/v1/expands"
let statusTypesUrl = domainUrl + "/api/v1/gameStatus"
let playTypesUrl = domainUrl + "/api/v1/playTypes"
let playTypesPlayerUrl = domainUrl + "/api/v1/playTypesPlayer"
let positionsUrl = domainUrl + "/api/v1/positions"
let platformsUrl = domainUrl + "/api/v1/platforms"
let powerPlayStrengthUrl = domainUrl + "/api/v1/powerPlayStrength"
let leagueLeaderTypesUrl = domainUrl + "/api/v1/leagueLeaderTypes"
let depthTypesUrl = domainUrl + "/api/v1/depthTypes"
let imageTypesUrl = domainUrl + "/api/v1/imageTypes"
let imageSizesUrl = domainUrl + "/api/v1/imageSizes"
let rosterTypesUrl = domainUrl + "/api/v1/rosterTypes"
let siteLanguageUrl = domainUrl + "/api/v1/siteLanguage"
let teamDesignationsUrl = domainUrl + "/api/v1/teamDesignations"
let rosterStatusesUrl = domainUrl + "/api/v1/rosterStatuses"
let eventTypesUrl = domainUrl + "/api/v1/eventTypes"
let scheduleTypesUrl = domainUrl + "/api/v1/scheduleTypes"
let tournamentTypesUrl = domainUrl + "/api/v1/tournamentTypes"
let seriesCodesUrl = domainUrl + "/api/v1/seriesCodes"
let performerTypesUrl = domainUrl + "/api/v1/performerTypes"
let prospectCategoriesUrl = domainUrl + "/api/v1/prospectCategories"

let lineScoreSuffix = "/linescore"
let scheduleSuffix="&expand=schedule.linescore"

let shotsAvailable = "2010-10-07"
