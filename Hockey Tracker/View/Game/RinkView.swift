//
//  RinkView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct RinkView: View {
    @StateObject var gameVM: GameVM
    
    @AppStorage ("showGoals") var showGoals: Bool?
    @AppStorage ("showShots") var showShots: Bool?
    @AppStorage ("showMissedShots") var showMissedShots: Bool?
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool?
    
    @State private var scaleFactor: CGFloat = 0.0
    @State private var currentPeriod: Int = 0
    @State private var showSettings: Bool = false
    @State private var updateView: Bool = false
    
    @State var orientation = UIDevice.current.orientation
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
        
    var body: some View {
        
        ScrollView(.vertical) {
            PeriodView(currentPeriod: $currentPeriod).environmentObject(gameVM)
                
            // TODO: - when you start the geometry height is 0
            GeometryReader { geometry in
                ZStack {
                    Image("Rink")
                        .resizable()
                        .aspectRatio(200/85, contentMode: .fit)
                        .background(Color.init(UIColor.lightGray))
                        .onAppear {
                            print("on appear", geometry.size)
                            print("Portrait Mode", UIDevice.current.orientation.isPortrait)
                            scaleFactor = geometry.size.width / rinkWidth
                        }
                        .onReceive(orientationChanged) { _ in
                            scaleFactor = geometry.size.width / rinkWidth
                            self.orientation = UIDevice.current.orientation
                        }
                    let plays = gameVM.playsForPeriod(currentPeriod)
                    
                    ForEach(plays, id: \.id) { play in
                        ChevronView(play: play, scaleFactor: scaleFactor).environmentObject(gameVM)
                    }
                }
            } // Geometry

            .frame(height: rinkDisplayHeight)
            HStack {
                SummaryShotsView().environmentObject(gameVM)
                Spacer ()
                SummaryGoalView().environmentObject(gameVM)
            }
            .padding()
            //.frame(height:50)
            Spacer()
        } // ScrollView
        .onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        
        }
        .navigationBarTitle(Text ("\(gameVM.awayTeam) \(gameVM.awayScore) at \(gameVM.homeTeam) \(gameVM.homeScore) \(gameVM.gameStatus)"))
        
        .navigationBarItems (
            trailing:
                Image(systemName: "gear")
                .imageScale(.large)
                .foregroundColor(.blue)
                    .onTapGesture {
                        self.showSettings.toggle()
                    }
                    .popover(isPresented: $showSettings) {
                        SettingsView().environmentObject(gameVM)
                    }
        )
        .background(Color.init(UIColor.lightGray))
        .onAppear {
            if showGoals == nil {
                showGoals = true
            }
            if showShots == nil {
                showShots = false
            }
            if showMissedShots == nil {
                showMissedShots = false
            }
            if showBlockedShots == nil {
                showBlockedShots = false
            }
            gameVM.fetchGameData()
        }
        .edgesIgnoringSafeArea([.bottom, .leading])
    }

    var rinkDisplayWidth: CGFloat {
        return rinkWidth * scaleFactor
    }
    
    var rinkDisplayHeight:CGFloat {
        return rinkHeight * scaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RinkView(gameVM: GameVM(gameLink: domainUrl + "/api/v1/game/2019021011/feed/live"))
        }
    }
}
