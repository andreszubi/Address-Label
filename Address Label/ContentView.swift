//
//  ContentView.swift
//  Address Label
//
//  Created by Andres Zubizarreta on 2/19/2026.
//

import SwiftUI

struct Address: Identifiable {
    let id = UUID()
    var AddressLine: String
    var city: String
    var state: String
    var zip: String
    var country: String
}

struct ContentView: View {
    @State private var addresses: [Address] = []
    @State private var addressLine: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zip: String = ""
    @State private var country: String = ""
    
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse.circle")
                    .font(.system(size: 50))
                    .foregroundStyle(.pink)
                    .symbolRenderingMode(.hierarchical)
                Text("Address List")
            }
            .font(.title)
            .bold()
            .foregroundStyle(
                LinearGradient(
                    colors: [Color.accentColor, Color.accentColor.opacity(0.55)],
                    startPoint: .top,
                    endPoint: .bottom
                    )
                )
            List {
                ForEach(addresses) { address in
                    VStack(alignment: .leading) {
                        Text(address.AddressLine)
                        Text("\(address.city), \(address.state) \(address.zip)")
                        Text(address.country)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.tint)
                
                
                TextField("Address Line", text: $addressLine)
                TextField("City", text: $city)
                TextField("State", text: $state)
                TextField("Zip", text: $zip)
                TextField("Country", text: $country)
                Button("Add Address") {
                    if (!addressLine.isEmpty && !city.isEmpty && !state.isEmpty && !zip.isEmpty && !country.isEmpty) {
                        let address = Address(AddressLine: addressLine, city: city, state: state, zip: zip, country: country)
                        addresses.append(address)
                    }
                    
                    
                    
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
