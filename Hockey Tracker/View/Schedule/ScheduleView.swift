//
//  ScheduleView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/22/20.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    
    @State private var showInfoView = false
    @State private var showDatePicker = false
    @State private var selectedDate = Date()
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 30
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging( let transition):
                return transition
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(hexString: "1E1E21")
        //UINavigationBar.appearance().backgroundColor = UIColor.blue
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(hexString: "F8F8F9")]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(hexString: "F8F8F9")]
    }
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    Color("Background")
                        .edgesIgnoringSafeArea(.all)
                    VStack(spacing: 0) {
                        DateSelectionView().environmentObject(scheduleVM)
                        HStack {
                            Text (scheduleVM.scheduleDate.convertToString(dateformat: .day))
                                .foregroundColor(Color("Primary"))
                            Spacer()
                        }
                        .padding()
                        GameListView().environmentObject(scheduleVM)
                    } // VStack
                    .navigationBarTitle("NHL Schedule", displayMode: .inline)
                    .navigationBarItems (
                        leading:
                            Image(systemName: "info.circle")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showInfoView.toggle()
                            }
                            .sheet(isPresented: $showInfoView) {
                                InfoView()
                            },
                        trailing:
                            Image(systemName: "calendar")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.showDatePicker.toggle()
                            }
                            .sheet(isPresented: $showDatePicker) {
                                DatePickerView().environmentObject(scheduleVM)
                                    .frame(width:300, height:400)
                            }
                    )
                    .gesture(LongPressGesture(minimumDuration: 0.01)
                        .sequenced(before: DragGesture())
                        .onEnded ( { value in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            if drag.translation.width < -dragAreaThreshold {
                                scheduleVM.subtractDay()
                            } else if drag.translation.width > dragAreaThreshold {
                                scheduleVM.addDay()
                            }
                        })
                    )
                }
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
