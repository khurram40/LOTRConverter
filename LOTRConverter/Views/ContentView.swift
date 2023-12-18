//
//  ContentView.swift
//  LOTRConverter
//
//  Created by khurram on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftCurrency: Currency
    @State var leftAmount = ""
    @State var leftAmountTmp = ""
    @State var leftIsTyping = false
    @State var rightCurrency: Currency
    @State var rightAmount = ""
    @State var rightAmountTmp = ""
    @State var rightIsTyping = false
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("prancingpony")
                    .resizable()
                    .scaledToFit() // Allows us to omit width below
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                HStack {
                    VStack {
                        HStack {
                            leftCurrency.image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(leftCurrency.title)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        TextField("Amount", text: $leftAmount, onEditingChanged: { isTyping in
                            leftIsTyping = isTyping
                            leftAmountTmp = leftAmount
                        })
                        .padding(5)
                        .background(Color(.systemGray6))
                        .cornerRadius(7)
                        .keyboardType(.decimalPad)
                        .onChange(of: leftIsTyping ? leftAmount : leftAmountTmp) { _ in
                            rightAmount = leftCurrency.convertMyCurrency(of: leftAmount, to: rightCurrency)
                        }
                        .onChange(of: leftCurrency) { _ in
                            leftAmount = rightCurrency.convertMyCurrency(of: rightAmount, to: leftCurrency)
                        }
                    }
                    .padding(.leading, 10)
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.title)
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            rightCurrency.image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .padding(5)
                            .background(Color(.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightIsTyping ? rightAmount : rightAmountTmp) { _ in
                                leftAmount = rightCurrency.convertMyCurrency(of: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency) { _ in
                                rightAmount = leftCurrency.convertMyCurrency(of: leftAmount, to: rightCurrency)
                            }
                    }
                    .padding(.trailing, 10)
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(75)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 33)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(leftCurrency: .copperPenny, rightCurrency: .goldPenny)
    }
}
