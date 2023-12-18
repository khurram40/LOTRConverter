//
//  CurrencyTests.swift
//  LOTRConverterTests
//
//  Created by khurram on 11/13/23.
//

import XCTest
@testable import LOTRConverter

final class CurrencyTests: XCTestCase {
    // Will serve as the baseline for conversions
    let goldPiece: Currency = .goldPiece
    
    func testGoldPenny() {
        let goldPenny: Currency = .goldPenny
        
        let goldPennyFromFullGoldPiece = goldPiece.convertMyCurrency(of: "1", to: goldPenny)
        XCTAssertEqual(goldPennyFromFullGoldPiece, "4.00")
        
        let goldPennyFromHalfGoldPiece = goldPiece.convertMyCurrency(of: "0.5", to: goldPenny)
        XCTAssertEqual(goldPennyFromHalfGoldPiece, "2.00")
        
        // Inverse
        let goldPieceFromGoldPenny = goldPenny.convertMyCurrency(of: "1", to: goldPiece)
        XCTAssertEqual(goldPieceFromGoldPenny, "0.25")
    }
    
    func testSilverPiece() {
        let silverPiece: Currency = .silverPiece
        
        let silverPieceFromFullGoldPiece = goldPiece.convertMyCurrency(of: "1", to: silverPiece)
        XCTAssertEqual(silverPieceFromFullGoldPiece, "16.00")
        
        let silverPieceFromHalfGoldPiece = goldPiece.convertMyCurrency(of: "0.5", to: silverPiece)
        XCTAssertEqual(silverPieceFromHalfGoldPiece, "8.00")
        
        // Inverse
        let goldPieceFromSilverPiece = silverPiece.convertMyCurrency(of: "1", to: goldPiece)
        XCTAssertEqual(goldPieceFromSilverPiece, "0.06")
    }
    
    func testSilverPenny() {
        let silverPenny: Currency = .silverPenny
        
        let silverPennyFromFullGoldPiece = goldPiece.convertMyCurrency(of: "1", to: silverPenny)
        XCTAssertEqual(silverPennyFromFullGoldPiece, "64.00")
        
        let silverPennyFromHalfGoldPiece = goldPiece.convertMyCurrency(of: "0.5", to: silverPenny)
        XCTAssertEqual(silverPennyFromHalfGoldPiece, "32.00")
        
        // Inverse
        let goldPieceFromSilverPenny = silverPenny.convertMyCurrency(of: "1", to: goldPiece)
        XCTAssertEqual(goldPieceFromSilverPenny, "0.02")
    }
    
    func testCopperPenny() {
        let copperPenny: Currency = .copperPenny
        
        let copperPennyFromFullGoldPiece = goldPiece.convertMyCurrency(of: "1", to: copperPenny)
        XCTAssertEqual(copperPennyFromFullGoldPiece, "640.00")
        
        let copperPennyFromHalfGoldPiece = goldPiece.convertMyCurrency(of: "0.5", to: copperPenny)
        XCTAssertEqual(copperPennyFromHalfGoldPiece, "320.00")
        
        // Inverse
        let goldPieceFromCopperPenny = copperPenny.convertMyCurrency(of: "10", to: goldPiece)
        XCTAssertEqual(goldPieceFromCopperPenny, "0.02")
    }
    
    func testRandomConversions() {
        // 3 silver pennies = 0.1875 gold pennies
        let silverPenny: Currency = .silverPenny
        let goldPenny: Currency = .goldPenny
        XCTAssertEqual(silverPenny.convertMyCurrency(of: "3", to: goldPenny), "0.19")
        
        // 5 silver pieces = 200 copper pennies
        let silverPiece: Currency = .silverPiece
        let copperPenny: Currency = .copperPenny
        XCTAssertEqual(silverPiece.convertMyCurrency(of: "5", to: copperPenny), "200.00")
    }
}
