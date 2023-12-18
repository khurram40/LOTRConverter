//
//  Currency.swift
//  LOTRConverter
//
//  Created by khurram on 11/13/23.
//

import SwiftUI

enum Currency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: Image {
        switch self {
        case .copperPenny:
            return Image("copperpenny")
        case .silverPenny:
            return Image("silverpenny")
        case .silverPiece:
            return Image("silverpiece")
        case .goldPenny:
            return Image("goldpenny")
        case .goldPiece:
            return Image("goldpiece")
        }
    }
    
    var title: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        }
    }
    
    func convertMyCurrency(of: String, to: Currency) -> String {
        guard let myAmount = Double(of) else {
            return ""
        }
        
        // Capture percentage of the portion.
        // i.e. if self is .silverPenny and we want to convert from 32 of them, portion is 0.5. If we're
        //      converting to .goldPenny, we can multiply by the 0.5. Therefore 32 .silverPenny is 4 .goldPenny.
        let normalizedMyPortion = myAmount / self.rawValue
        let normalizedToPortion = to.rawValue * normalizedMyPortion
        
        return String(format: "%.2f", normalizedToPortion)
    }
}
