//
//  SettingsView.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    @State private var selection = 1
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection, label: Text("Favorite Genre"), content: {
                    Text("Action").tag(1)
                    Text("Comedy").tag(2)
                    Text("Horror").tag(3)
                    Text("Love").tag(4)
                })
                Section(header: Text("Email"), content: {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                })
                
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Save")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(false))
    }
}
