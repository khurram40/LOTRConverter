//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by khurram on 11/13/23.
//

import SwiftUI

struct ExchangeRate: View {
    let fromCurrency: Currency
    let exchangeInfo: String
    let toCurrency: Currency
    
    var body: some View {
        HStack {
            fromCurrency.image
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(exchangeInfo)
            
            toCurrency.image
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(fromCurrency: Currency.goldPiece,
                     exchangeInfo: LOTRConverterStrings.ExchangeRate.goldPieceToGoldPenny,
                     toCurrency: Currency.goldPenny)
        .previewLayout(.sizeThatFits)
    }
}
