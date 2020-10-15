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

    init() {
        //UITableView.appearance().backgroundColor = .lightGray
        //UITableView.appearance().separatorColor = .black
    }
    
    var body: some View {
        VStack {
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
                            DatePicker("Games Date", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(width:300, height:400)
                                .onDisappear {
                                    scheduleVM.setDate(selectedDate)
                                }
                        }
                )
                .background(Color(UIColor.lightGray))
                .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
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
