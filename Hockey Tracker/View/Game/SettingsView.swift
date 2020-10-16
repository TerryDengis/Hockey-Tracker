//
//  SettingsView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gameVM: GameStore
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage ("showGoals") var showGoals: Bool = true
    @AppStorage ("showShots") var showShots: Bool = false
    @AppStorage ("showMissedShots") var showMissedShots: Bool = false
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Show")) {
                    Toggle("Goals", isOn: $showGoals)
                    Toggle("Shots", isOn: $showShots)
                    Toggle("Missed Shots", isOn: $showMissedShots)
                    Toggle("Blocked Shots", isOn: $showBlockedShots)
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
