//
//  ContentView.swift
//  TipCalculator
//
//  Created by Fred on 12/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bill = 0.0
    private let tipOptions = [0.0, 5.0, 10.0, 15.0]
    @State private var tip: Double = 0.0
    @State private var people: Double = 1
    
    var calculatedTip: Double {
        let calculateTip = bill * (tip/100)
        let total = (bill + calculateTip) / people
        return total
    }
    
    var tipAmount: Double {
        bill * (tip / 100)
    }
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Bill: \(bill, format: .number.precision(.fractionLength(2)))")
            Text("Tips: \(tipAmount, format: .number.precision(.fractionLength(2)))")
            Text("Total: \(calculatedTip, format: .number.precision(.fractionLength(2)))")
        }
        .frame(maxWidth: .infinity, maxHeight: 220)
        .background(Color.black)
        .foregroundColor(.white)
        .font(.system(size: 26, weight: .regular).monospaced())
        
        Spacer()
        
        VStack (alignment: .leading) {
            
            HStack {
                Text("Bill Amount:")
                TextField("Bill amount", value: $bill, format: .number.precision(.fractionLength(2)))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Text("Split by:")
                TextField("Split by", value: $people, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .frame(width: 50)
                Text("people")
            }
            
            HStack {
                Text("Tip:")
                Picker("Tip", selection: $tip) {
                    ForEach(tipOptions, id: \.self) { option in
                        Text("\(option, format: .number.precision(.fractionLength(0)))%")
                            .tag(option)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
        }
        .padding(.horizontal, 30)
        
        Spacer()
        
        
    }
}

#Preview {
    ContentView()
}
