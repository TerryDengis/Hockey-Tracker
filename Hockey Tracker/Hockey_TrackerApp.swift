//
//  Hockey_TrackerApp.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

@main
struct Hockey_TrackerApp: App {
    @StateObject var scheduleVM = ScheduleStore()
    var body: some Scene {
        WindowGroup {
            ScheduleView().environmentObject(scheduleVM)
        }
    }
}
