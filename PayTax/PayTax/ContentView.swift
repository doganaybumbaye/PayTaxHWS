//
//  ContentView.swift
//  PayTax
//
//  Created by Doğanay Şahin on 14.09.2021.
//

import SwiftUI

struct ContentView: View {

    @State private var amount = ""
    @State private var numberOfPeople = 2
    let percentOfTax = [0,2, 10, 15, 20]
    @State private var selectedPercent = 2
    
    var totalForPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(percentOfTax[selectedPercent])
        let orderAmount = Double(amount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        
        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                        Picker(selection: $numberOfPeople, label: Text("Number of people"), content: {
                            ForEach(2..<100){
                                Text("\($0) people")
                                
                            }
                        })
   
                    }
                    
                    Section(header : Text("How much do you want to leave?")){
                        Picker(selection: $selectedPercent, label: Text("Percent of tax"), content: {
                            ForEach(0 ..< percentOfTax.count){
                                Text("\(self.percentOfTax[$0])%")
                            }
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Text("$\(totalForPerson, specifier: "%2.f")")
                        
                    
                        
                    
                    
                    
                }
                
            }

            
            .navigationBarTitle("Pay Tax")
        }
    
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}
