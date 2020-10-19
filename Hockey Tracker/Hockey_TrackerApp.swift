//
//  Hockey_TrackerApp.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

@main
struct Hockey_TrackerApp: App {
    @StateObject var scheduleStore = ScheduleStore()
    var body: some Scene {
        WindowGroup {
            ScheduleView().environmentObject(scheduleStore)
        }
    }
}
