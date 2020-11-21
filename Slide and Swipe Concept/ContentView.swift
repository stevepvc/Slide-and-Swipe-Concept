//
//  ContentView.swift
//  Slide and Swipe Concept
//
//  Created by Steven Hovater on 7/13/20.
//  Copyright © 2020 Steven Hovater. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var text:String
    var body: some View {
        Text(text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: "Page 1")
    }
}
