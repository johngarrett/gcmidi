//
//  ContentView.swift
//  hate xcode AGAIN
//
//  Created by garrepi on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    var handler: GCHandler
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(handler: GCHandler())
    }
}
