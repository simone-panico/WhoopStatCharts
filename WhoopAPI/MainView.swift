//
//  MainView.swift
//  WhoopAPI
//
//  Created by Simone Panico on 06.07.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Charts", systemImage: "chart.pie")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
            
        }
    }
}

#Preview {
    MainView()
}
