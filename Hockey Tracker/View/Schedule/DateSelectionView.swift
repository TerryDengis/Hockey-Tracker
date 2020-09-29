//
//  DateSelectionView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct DateSelectionView: View {
    @EnvironmentObject var scheduleVM: ScheduleVM
    @State private var currentDate: Date = Date()
    
    var body: some View {
        let dateRange = currentDate.getDateRange(firstDay: -60, lastDay: 60)

        HStack {
            ScrollView(.horizontal) {
                ScrollViewReader { value in
                    HStack {
                        ForEach(0..<dateRange.count) { index in
                            VStack {
                                Text(dateRange[index].isToday() ? "Today" : dateRange[index].convertToString(dateformat: .shortDate))
                                    .bold()
                                    .frame(width: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .border(dateRange[index] == currentDate ? Color.yellow : Color.black, width: 2)
                                    .foregroundColor(dateRange[index] == currentDate ? .white : .gray)
                                    .saturation(dateRange[index] == currentDate ? 1.0 : 0.0)
                                    .font(.body)
                                    .id(index)
                                    .onTapGesture {
                                        withAnimation {
                                            self.currentDate = dateRange[index]
                                            value.scrollTo(60, anchor: .center)
                                            scheduleVM.setDate(dateRange[index])
                                        }
                                    }
                                    .onAppear {
                                        value.scrollTo(60, anchor: .center)
                                    }
                            }
                        }
                    }
                }
            } // ScrollView
            //.frame(width: UIScreen.main.bounds.size.width)
        } // HStack
        .background(Color.black)
    }
}

struct DateSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectionView()
    }
}
