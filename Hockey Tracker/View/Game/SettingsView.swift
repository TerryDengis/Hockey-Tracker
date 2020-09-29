//
//  SettingsView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var gameVM: GameVM
    
    @State private var goals: Bool = true
    @State private var shots: Bool = false
    @State private var missedShots: Bool = false
    @State private var blockedShots: Bool = false
    
    @AppStorage ("showGoals") var showGoals: Bool?
    @AppStorage ("showShots") var showShots: Bool?
    @AppStorage ("showMissedShots") var showMissedShots: Bool?
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool?
    
    var body: some View {
        Form {
            Section(header: Text("Show")) {
                Toggle("Goals", isOn: $goals)
                    .onTapGesture {
                        goals.toggle()
                        showGoals = goals
                        gameVM.objectWillChange.send()
                    }
                Toggle("Shots", isOn: $shots)
                    .onTapGesture {
                        shots.toggle()
                        showShots = shots
                        gameVM.objectWillChange.send()
                    }
                Toggle("Missed Shots", isOn: $missedShots)
                    .onTapGesture {
                        missedShots.toggle()
                        showMissedShots = missedShots
                        gameVM.objectWillChange.send()
                    }
                Toggle("Blocked Shots", isOn: $blockedShots)
                    .onTapGesture {
                        blockedShots.toggle()
                        showBlockedShots = blockedShots
                        gameVM.objectWillChange.send()
                    }
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 250, maxHeight: .infinity)
        .onAppear {
             goals = showGoals ?? true
             shots = showShots ?? false
             missedShots = showMissedShots ?? false
             blockedShots = showBlockedShots ?? false
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(gameVM: GameVM(gameLink: domainUrl + "/api/v1/game/2019021011/feed/live"))
    }
}
