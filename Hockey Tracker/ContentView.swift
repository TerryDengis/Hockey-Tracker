//
//  ContentView.swift
//  Hockey Tracker
//
//  Created by Terry Dengis on 9/16/20.
//

import SwiftUI

struct RinkView: View {
    @State private var scaleFactor: CGFloat = 0.0
    @State private var chevronSize: CGFloat = 0.0
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View {
        
        VStack {
            ScoreView()
            PeriodView()
            GeometryReader { geometry in
                Image("Rink1")
                    .resizable()
                    .border(Color.black, width: 2)
                    .aspectRatio(200/85, contentMode: .fit)
                    .frame(width: rinkWidth(), height: rinkHeight())
                    .background(Color.black)
                    .onAppear{
                        scaleFactor = geometry.size.width / _rinkWidth
                        print ("geometry", geometry.size)
                        print ("Appear ScaleFactor ", scaleFactor)
                    }
                    .onReceive(orientationChanged) { x in
                        scaleFactor = geometry.size.width / _rinkWidth
                        print ("geometry", geometry.size)
                        print ("Orientation Scale Factor ", scaleFactor)
                    }
                
                Image(systemName: "1.circle")
                    .position(x: 90 * scaleFactor, y: 42.5 * scaleFactor)
                    .frame (width: 10, height:10)
                    .foregroundColor(Color(UIColor(hexString: calgary)))
                    .onTapGesture {
                        print("Tap")
                    }
                Image(systemName: "2.square")
                    .position(x: 150 * scaleFactor, y: 42.5 * scaleFactor)
                    .frame (width: 10, height:10)
                    .foregroundColor(Color(UIColor(hexString: stLouis)))
                    .onTapGesture {
                        print("Tap")
                        print(UIDevice.current.name)
                    }
            }//Geometry
            .background(Color.green)
            .frame(height: rinkHeight())
            if UIDevice.current.orientation.isPortrait || UIDevice.current.name.contains("iPad"){
                HStack {
                    SummaryShotsView()
                    Divider()
                    SummaryGoalView()
                }
                .frame(height:50)
            }
            Spacer()
        }
    }

    
    func rinkWidth () -> CGFloat {
        return _rinkWidth * scaleFactor
    }
    
    func rinkHeight () -> CGFloat {
        return _rinkHeight * scaleFactor
    }
    
    // MARK: - Drawing Constants
    let _rinkHeight: CGFloat = 85.0
    let _rinkWidth :CGFloat = 200.0
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RinkView()
        }
    }
}
