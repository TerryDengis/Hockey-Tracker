//
//  Play+Extension.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 10/18/20.
//

import Foundation
extension GameSummary.LiveData.Plays.Play {
    
    func ordinalEventTime() -> String {
        "\(self.about.ordinalNum) \(self.about.period <= 3 ? "Period" :"") @ \(self.about.periodTime)"
    }
}
