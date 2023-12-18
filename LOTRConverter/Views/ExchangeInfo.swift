//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by khurram on 11/13/23.
//

import SwiftUI

fileprivate typealias ExchangeInfoStrings = LOTRConverterStrings.ExchangeInfo
fileprivate typealias ExchangeRateStrings = LOTRConverterStrings.ExchangeRate

// MARK: - View
struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismissPage
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                Text(ExchangeInfoStrings.title)
                    .font(.largeTitle)
                    .padding(.top, 50)
                    .padding(.bottom, 25)
                
                Text(ExchangeInfoStrings.infoDescription)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 125)
                
                VStack {
                    ExchangeRate(fromCurrency: .goldPiece, exchangeInfo: ExchangeRateStrings.goldPieceToGoldPenny, toCurrency: .goldPenny)
                    ExchangeRate(fromCurrency: .goldPenny, exchangeInfo: ExchangeRateStrings.goldPennyToSilverPiece, toCurrency: .silverPiece)
                    ExchangeRate(fromCurrency: .silverPiece, exchangeInfo: ExchangeRateStrings.silverPieceToSilverPenny, toCurrency: .silverPenny)
                    ExchangeRate(fromCurrency: .silverPenny, exchangeInfo: ExchangeRateStrings.silverPennyToCopperPenny, toCurrency: .copperPenny)
                }
                .padding([.top, .bottom], 25)
                
                Button("Done") {
                    dismissPage()
                }
                .padding()
                .background(Color(.systemBrown).opacity(0.75))
                .font(.title)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
            .padding(.bottom, 25)
        }
        .background(Color(.systemBrown))
        .foregroundColor(.black) // i.e. not supporting dark mode
    }
}

// MARK: - Previews
struct ExchangeInfo_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeInfo()
    }
}
