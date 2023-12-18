//
//  LOTRConverterApp.swift
//  LOTRConverter
//
//  Created by khurram on 11/13/23.
//

import SwiftUI

@main
struct LOTRConverterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(leftCurrency: .silverPiece, rightCurrency: .goldPiece)
        }
    }
}
