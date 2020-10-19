//
//  SettingsView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gameStore: GameStore
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage ("showGoals") var showGoals: Bool = true
    @AppStorage ("showShots") var showShots: Bool = false
    @AppStorage ("showMissedShots") var showMissedShots: Bool = false
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool = false

    @AppStorage ("showChallenges") var showChallenges: Bool = false
    @AppStorage ("showFaceoffs") var showFaceoffs: Bool = false
    @AppStorage ("showGiveaways") var showGiveaways: Bool = false
    @AppStorage ("showHits") var showHits: Bool = false
    @AppStorage ("showPenalties") var showPenalties: Bool = false
    @AppStorage ("showTakeaways") var showTakeaways: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Show in rink & include in list")) {
                    Toggle("Goals", isOn: $showGoals)
                    Toggle("Shots", isOn: $showShots)
                    Toggle("Missed Shots", isOn: $showMissedShots)
                    Toggle("Blocked Shots", isOn: $showBlockedShots)
                }
                Section(header: Text("Include in list")) {
                    Toggle("Challenges", isOn: $showChallenges)
                    Toggle("Faceoffs", isOn: $showFaceoffs)
                    Toggle("Giveaways", isOn: $showGiveaways)
                    Toggle("Hits", isOn: $showHits)
                    Toggle("Penalties", isOn: $showPenalties)
                    Toggle("Takeaways", isOn: $showTakeaways)
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = GameStore()
        vm.setUrl( domainUrl + "/api/v1/game/2019021011/feed/live")
        
        return SettingsView().environmentObject(vm)
    }
}
