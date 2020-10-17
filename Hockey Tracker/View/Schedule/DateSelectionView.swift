//
//  DateSelectionView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/23/20.
//

import SwiftUI

struct DateSelectionView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    
    var body: some View {
        let dateRange = scheduleVM.scheduleDate.getDateRange(firstDay: -30, lastDay: 30)

        ScrollView(.horizontal) {
            ScrollViewReader { value in
                HStack {
                    ForEach(0..<dateRange.count) { index in
                        Text(dateRange[index].isToday() ? "Today" : dateRange[index].convertToString(dateformat: .shortDate))
                            .bold()
                            .frame(width: 80, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .border(dateRange[index] == scheduleVM.scheduleDate ? Color.yellow : Color("Menu"), width: 2)
                            .foregroundColor(dateRange[index] == scheduleVM.scheduleDate ? Color("Primary") : Color("Secondary"))
                            .saturation(dateRange[index] == scheduleVM.scheduleDate ? 1.0 : 0.0)
                            .font(.body)
                            .id(index)
                            .onTapGesture {
                                withAnimation {
                                    self.scheduleVM.setDate(dateRange[index])
                                    value.scrollTo(30, anchor: .center)
                                    scheduleVM.setDate(dateRange[index])
                                }
                            }
                            .onAppear {
                                value.scrollTo(30, anchor: .center)
                            }
                    }
                }
            }
        } // ScrollView
        .background(Color("Menu"))
        .edgesIgnoringSafeArea([.leading, .trailing])
    }
}

struct DateSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectionView()
    }
}
