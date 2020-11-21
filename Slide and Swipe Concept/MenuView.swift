//
//  MenuView.swift
//  Prayer Sparks
//
//  Created by Steven Hovater on 6/21/20.
//  Copyright © 2020 Steven Hovater. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                Text("Include Packs:")
                    .foregroundColor(.gray)
                    .font(.title)
            }
            
            HStack {
                Image(systemName: "flame")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Starter Pack")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 40)
            HStack {
                Image(systemName: "bolt.circle")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Boost")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 10)
            HStack {
                Image(systemName: "heart.circle")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 10)
            Spacer()
            
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 32/255))
            .edgesIgnoringSafeArea(.all)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
