//
//  SelectCurrencyOptionsTab.swift
//  LOTRConverter
//
//  Created by khurram on 11/13/23.
//

import SwiftUI

fileprivate let colorTheme = Color(.systemBrown)

struct SelectCurrencyOptionsTab: View {
    let currency: Currency
    
    var body: some View {
       ZStack(alignment: .bottom) {
           Rectangle()
               .foregroundColor(colorTheme)
               .cornerRadius(22)
                            
           currency.image
                .resizable()
                .scaledToFit()
                .padding(.all, 5)
            
           Text(currency.title)
               .background(colorTheme.opacity(0.75))
               .font(.caption2)
               .padding(.bottom, 5)
        }
        .frame(width: 100, height: 100)
    }
}

struct SelectCurrencyOptionsTab_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SelectCurrencyOptionsTab(currency: .copperPenny)
                .previewLayout(.sizeThatFits)
            
            SelectCurrencyOptionsTab(currency: .goldPiece)
                .previewLayout(.sizeThatFits)
        }
    }
}
