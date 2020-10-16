//
//  ScheduleView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/22/20.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    @State private var showDatePicker = false
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    DateSelectionView().environmentObject(scheduleVM)
                    if scheduleVM.games.count == 0 {
                        Text("No Games Scheduled")
                            .font(.largeTitle)
                        Spacer()
                    } else {
                        GameListView().environmentObject(scheduleVM)
                    }
                } // VStack
                .navigationBarTitle("NHL Schedule", displayMode: .inline)
                .navigationBarItems (
                    trailing:
                        Image(systemName: "calendar")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            self.showDatePicker.toggle()
                        }
                        .popover(isPresented: $showDatePicker) {
                            DatePickerView().environmentObject(scheduleVM)
                                .frame(width:300, height:400)
                        }
                )
                .background(Color(UIColor.systemGray))
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView().environmentObject(ScheduleStore())
    }
}
