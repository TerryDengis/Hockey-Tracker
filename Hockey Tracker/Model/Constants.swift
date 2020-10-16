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
let lineScoreSuffix = "/linescore"
let scheduleSuffix="&expand=schedule.linescore"

let shotsAvailable = "2010-10-07"
