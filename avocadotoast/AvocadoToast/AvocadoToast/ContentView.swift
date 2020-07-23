//
//  ContentView.swift
//  AvocadoToast
//
//  Copyright © 2020 Arunabh Das. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello")
            Button(action: {
                // TODO
            }) {
                Image("pear")
                .renderingMode(.original)
            }
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
