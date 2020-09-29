//
//  RinkView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct RinkView: View {
    @ObservedObject var gameVM: GameVM
    
    @AppStorage ("showGoals") var showGoals: Bool?
    @AppStorage ("showShots") var showShots: Bool?
    @AppStorage ("showMissedShots") var showMissedShots: Bool?
    @AppStorage ("showBlockedShots") var showBlockedShots: Bool?
    
    @State private var scaleFactor: CGFloat = 0.0
    @State private var currentPeriod: Int = 0
    @State private var showSettings: Bool = false
    @State private var updateView: Bool = false
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View {
        
        ScrollView(.vertical) {
            PeriodView(gameVM: gameVM, currentPeriod: $currentPeriod)
                .padding(.top, 30)
            // TODO: - when you start the geometry height is 0
            GeometryReader { geometry in
                ZStack {
                Image("Rink")
                    .resizable()
                    .aspectRatio(200/85, contentMode: .fit)
                    .background(Color.init(UIColor.lightGray))
                    .onAppear {
                        print("on appear change", geometry.size)
                        print("Portrait Mode", UIDevice.current.orientation.isPortrait)
                        scaleFactor = geometry.size.width / rinkWidth
                    }
                    .onReceive(orientationChanged) { _ in
                        print("on orientation change", geometry.size)
                        print("Portrait Mode", UIDevice.current.orientation.isPortrait)
                        scaleFactor = geometry.size.width / rinkWidth
                    }
                ChevronView(gameVM: gameVM, period: currentPeriod, scaleFactor: scaleFactor)
                }
            } // Geometry

            .frame(height: rinkDisplayHeight)
            HStack {
                SummaryShotsView(gameVM: gameVM)
                Spacer ()
                SummaryGoalView(gameVM: gameVM)
            }
            .padding()
            //.frame(height:50)
            Spacer()
        } // VStack
        
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
                        SettingsView(gameVM: gameVM)
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
