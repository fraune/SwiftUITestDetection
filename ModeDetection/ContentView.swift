//
//  ContentView.swift
//  ModeDetection
//
//  Created by fraune on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var uiTestEnvironmentVariable = ProcessInfo.processInfo.environment["UI_Test"] ?? "false"

    var body: some View {
        NavigationStack {
            Form {
                Text("UI_Test=\(uiTestEnvironmentVariable)")
                Text("Hello, world!")
                NavigationLink("Show me the money!") {
                    MoneyView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
