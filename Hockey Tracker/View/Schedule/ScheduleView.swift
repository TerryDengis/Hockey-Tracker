//
//  ScheduleView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/22/20.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var scheduleVM: ScheduleVM
    
    init() {
        UITableView.appearance().backgroundColor = .lightGray
    }
    
    var body: some View {
        NavigationView {
            VStack {
                DateSelectionView().environmentObject(scheduleVM)
                if scheduleVM.games.count == 0 {
                    Text("No Games Scheduled")
                        .font(.largeTitle)
                } else {
                    GameListView().environmentObject(scheduleVM)
                        .ignoresSafeArea()
                }
                Spacer()
            } // VStack
            .navigationBarTitle("NHL Schedule", displayMode: .inline)
            .background(Color(UIColor.lightGray))
            .navigationBarItems (
                trailing:
                    Image(systemName: "calendar")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        //self.showSettings.toggle()
                    }
//                    .popover(isPresented: $showSettings) {
//                        SettingsView(gameVM: gameVM)
//                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
