//
//  MoneyView.swift
//  ModeDetection
//
//  Created by fraune on 10/17/24.
//

import SwiftUI

struct MoneyView: View {
    @State private var uiTestEnvironmentVariable = ProcessInfo.processInfo.environment["UI_Test"] ?? "false"

    var body: some View {
        Form {
            Text("Here is the money -> 💰💰💰")
            Text("UI_Test=\(uiTestEnvironmentVariable)")
        }
    }
}

#Preview {
    MoneyView()
}
