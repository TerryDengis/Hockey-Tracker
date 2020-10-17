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
        //UINavigationBar.appearance().backgroundColor = UIColor(hexString: "1E1E21")
        UINavigationBar.appearance().backgroundColor = UIColor.blue
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(hexString: "F8F8F9")]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(hexString: "F8F8F9")]
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack(spacing: 0) {
                    DateSelectionView().environmentObject(scheduleVM)
                    if scheduleVM.games.count == 0 {
                        Text("No Games Scheduled")
                            .font(.largeTitle)
                            .foregroundColor(Color("Primary"))
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
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("Background"))
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView().environmentObject(ScheduleStore())
    }
}
