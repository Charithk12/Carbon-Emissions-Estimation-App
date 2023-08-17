//
//  ContentView.swift
//  app idea
//
//  Created by Charith Kondapally on 3/27/23.
//
import SwiftUI

struct ContentView: View {
    @State private var aValue = ""
    @State private var efValue = ""
    @State private var ccfValue = ""
    @State private var emissionsResult = ""
    @State private var creditsResult = ""
    
    var body: some View {
        VStack {
            
            Image("1.")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .padding(.top, 50)
             
            Text(" Let's Reduce Carbon Emissions")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green) // changed here
                .padding(.top, 20)
            
            VStack(spacing: 20) {
                TextField("Area in Acres", text: $aValue)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                TextField("Factor per Acre", text: $efValue)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                TextField("Carbon Credit Conversion Factor", text: $ccfValue)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button("Calculate") {
                    guard let a = Double(aValue), let ef = Double(efValue), let ccf = Double(ccfValue) else {
                        emissionsResult = "Invalid input"
                        return
                    }
                    
                    let emissions = a * ef
                    emissionsResult = String(format: "Emissions: %.2f CO2e/ton", emissions)
                    
                    let carbonCredits = emissions * ccf
                    creditsResult = String(format: "Carbon Credits: %.2f", carbonCredits)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal)
            .padding(.top, 30)
            
            Spacer()
            
            HStack {
                Text(emissionsResult)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .opacity(emissionsResult.isEmpty ? 0 : 1)
                
                Spacer()
                
                Text(creditsResult)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .opacity(creditsResult.isEmpty ? 0 : 1)
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
        .edgesIgnoringSafeArea(.top)
        .colorScheme(.light)
        .accentColor(.green)
    }
}

