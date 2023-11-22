//
//  ContentView.swift
//  FindMyIP
//
//  Created by Kojo on 21/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = IPInformationViewModel()

    var body: some View {
        List {
            if let ipInfo = viewModel.ipInformation {
                Section(header: Text("IP Address")) {
                    Menu {
                        Button(action: {}) {
                            Text("Version: \(ipInfo.version ?? "Unknown")")
                        }
                        Button(action: {}) {
                            Text("City: \(ipInfo.city ?? "Unknown")")
                        }
                        Button(action: {}) {
                            Text("Region: \(ipInfo.region ?? "Unknown")")
                        }
                    } label: {
                        HStack {
                            Text(ipInfo.ip ?? "Unknown")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                    .menuStyle(DefaultMenuStyle())
                }
            } else if let errorMessage = viewModel.errorMessage {
                Section {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                }
            }
        }
        .onAppear {
            viewModel.getIPInformation()
        }
    }
}
