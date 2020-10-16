//
//  DatePickerView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 10/15/20.
//

import SwiftUI

struct DatePickerView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Games Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                Spacer ()
            }
            
            .navigationBarTitle("Select Date", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    },
                trailing:
                    Button(action: {
                        scheduleVM.setDate(selectedDate)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("OK")
                    }
            )
        }

    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView().environmentObject(ScheduleStore())
    }
}