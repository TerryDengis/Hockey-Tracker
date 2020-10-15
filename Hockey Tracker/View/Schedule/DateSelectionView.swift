//
//  DateSelectionView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct DateSelectionView: View {
    @EnvironmentObject var scheduleStore: ScheduleStore
    
    var body: some View {
        let dateRange = scheduleStore.scheduleDate.getDateRange(firstDay: -30, lastDay: 30)

        ScrollView(.horizontal) {
            ScrollViewReader { value in
                HStack {
                    ForEach(0..<dateRange.count) { index in
                        
                        Text(dateRange[index].isToday() ? "Today" : dateRange[index].convertToString(dateformat: .shortDate))
                            .bold()
                            .frame(width: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .border(dateRange[index] == scheduleStore.scheduleDate ? Color.yellow : Color.black, width: 2)
                            .foregroundColor(dateRange[index] == scheduleStore.scheduleDate ? .white : .gray)
                            .saturation(dateRange[index] == scheduleStore.scheduleDate ? 1.0 : 0.0)
                            .font(.body)
                            .id(index)
                            .onTapGesture {
                                withAnimation {
                                    self.scheduleStore.setDate(dateRange[index])
                                    value.scrollTo(30, anchor: .center)
                                    scheduleStore.setDate(dateRange[index])
                                }
                            }
                            .onAppear {
                                value.scrollTo(30, anchor: .center)
                            }
                    }
                }
            }
        } // ScrollView
        .background(Color.black)
        .edgesIgnoringSafeArea([.leading, .trailing])
    }
}

struct DateSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectionView()
    }
}
