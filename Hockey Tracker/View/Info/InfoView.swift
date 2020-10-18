//
//  InfoView.swift
//  Honeymoon
//
//  Created by Terry Dengis on 10/13/20.
//

import SwiftUI

struct InfoView: View {
    // MARK: - Properties
    @EnvironmentObject var scheduleVM: ScheduleStore
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            ScrollView (.vertical, showsIndicators: false) {
                VStack (alignment: .center, spacing:20) {
                    HeaderComponent()
                    Spacer(minLength: 10)
                    Text("App Info")
                        .fontWeight(.black)
                        .titleModifier()
                    AppInfoView()
                    Text ("Credits")
                        .fontWeight(.black)
                        .titleModifier()
                    CreditsView().environmentObject(scheduleVM)
                    Spacer(minLength: 10)
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Continue")
                            .buttonModifier()
                    }
                } // VStack
                .frame(minWidth: 0, maxWidth:.infinity)
                .padding(.top, 15)
                .padding(.bottom, 25)
                .padding(.horizontal, 25)
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView().environmentObject(ScheduleStore())
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(item1: "Application", item2: "Hockey Tracker")
            RowAppInfoView(item1: "Compatability", item2: "iPhone and iPad")
            RowAppInfoView(item1: "Developer", item2: "Terry Dengis")
            RowAppInfoView(item1: "Designer", item2: "Terry Dengis")
            RowAppInfoView(item1: "Version", item2: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {
    // MARK: - Properties
    var item1: String
    var item2: String
    
    var body: some View {
        VStack {
            HStack {
                Text(item1)
                    .foregroundColor(Color("Secondary"))
                Spacer()
                Text(item2)
                    .foregroundColor(Color("Primary"))
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    @EnvironmentObject var scheduleVM: ScheduleStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Data")
                    .foregroundColor(Color("Secondary"))
                Spacer(minLength: 10)
                Text("NHL")
                    .foregroundColor(Color("Primary"))
            }
            Divider()
            Text("Copywrite ©")
                .foregroundColor(Color("Secondary"))
            Text (scheduleVM.copywrite)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundColor(Color("Primary"))
        }
    }
}
