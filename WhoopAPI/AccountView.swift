//
//  AccountView.swift
//  WhoopAPI
//
//  Created by Simone Panico on 06.07.2024.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        // No update needed
    }
}

struct AccountView: View {
    @State private var loggedIn: Bool = false
    @State private var showSafari: Bool = false
    
    var body: some View {
        NavigationStack {
            if loggedIn {
                VStack {
                    
                }
                .navigationTitle("Account")
            } else {
                Button {
                    showSafari = true
                } label: {
                    Text("Login with Whoop")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                .sheet(isPresented: $showSafari) {
                            if let url = URL(string: "https://www.google.com") {
                                SafariView(url: url)
                            }
                        }

            }
            
            
            
        }
        
    }
}

#Preview {
    AccountView()
}
