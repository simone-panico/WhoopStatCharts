//
//  ContentView.swift
//  WhoopAPI
//
//  Created by Simone Panico on 09.06.2024.
//

import SwiftUI
import Charts

struct workoutStrain: Identifiable {
    var id = UUID()
    var strain: Float
    var created_at: Date
    
    init(strain: Float, created_at: String) {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        inputDateFormatter.locale = Locale(identifier: "en_US_POSIX")

        let date = inputDateFormatter.date(from: created_at)
        
        self.created_at = date ?? Date()
        self.strain = strain
    }
}

enum Picks: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}



var data: [workoutStrain] = [
    workoutStrain(strain: 13.5321, created_at: "2024-06-16T09:54:04.559Z"),
    workoutStrain(strain: 16.1525, created_at: "2024-06-13T14:37:40.695Z"),
    workoutStrain(strain: 11.2071, created_at:  "2024-06-11T13:22:20.779Z"),
    workoutStrain(strain: 12.8494, created_at: "2024-06-09T08:58:51.116Z"),
    workoutStrain(strain: 9.395, created_at:  "2024-06-07T16:05:44.105Z"),
    workoutStrain(strain: 15.4325, created_at: "2024-06-06T15:50:04.398Z")
]

struct ContentView: View {
    @State private var selectedPicks: [Picks] = Array(repeating: .chocolate, count: 5)
    var body: some View {
        NavigationStack {
            List(0 ..< 5) { item in
                VStack {
                    Text("Title for ")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Picker("Flavor", selection: $selectedPicks[item]) {
                        Text("Chocolate").tag(Picks.chocolate)
                        Text("Vanilla").tag(Picks.vanilla)
                        Text("Strawberry").tag(Picks.strawberry)
                    }
                    Chart(data) {
                        LineMark(x: .value("Date", $0.created_at), y: .value("Strain", $0.strain))
                    }
                    .frame(height: 200)
                    .padding()
                    Divider()
                }
            }
            .navigationTitle("Whoop Analysis")
        }
    }
}

#Preview {
    ContentView()
}



