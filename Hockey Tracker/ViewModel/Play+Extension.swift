//
//  Play+Extension.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 10/18/20.
//

import SwiftUI

extension GameSummary.LiveData.Plays.Play {
    
    func ordinalEventTime() -> String {
        "\(self.about.ordinalNum) @ \(self.about.periodTime)"
    }

    func xCoordinate () -> CGFloat {
        CGFloat (self.coordinates.x ?? 0) + rinkWidth / 2.0
    }

    func yCoordinate () -> CGFloat{
        CGFloat(self.coordinates.y ?? 0 ) * -1.0 + rinkHeight / 2.0
    }
    
    func  isGoal() -> Bool {
        self.result.eventTypeId == .goal
    }
    
    func teamCode () -> TeamCode {
        self.team?.triCode ?? .Anaheim
    }
}
