//
//  TopContentView.swift
//  Prayer Sparks
//
//  Created by Steven Hovater on 6/20/20.
//  Copyright © 2020 Steven Hovater. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var showMenu = false
    
    var body: some View {
        
        let tap = TapGesture()
        .onEnded {
            print("tap Gesture")
           
            if self.showMenu == true {
                withAnimation {
                    self.showMenu = false
                }
            }
        }
        
        return GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu
                    )
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        //.disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(tap)
            }
                .navigationBarTitle("Side Menu", displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                            
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
        }
}

struct ButtonContent: View {
    var body: some View {
        Image(systemName: "arrow.right")
        .resizable()
        .foregroundColor(.black)
        .frame(width: 10, height: 10)
        .padding()
        .background(Color.orange)
        .cornerRadius(30)
    }
}



struct MainView: View {
    
    @State var selectedPickerIndex = 0
    let availableMinutes = Array(1...59)
    @State var currentPageIndex = 0
    @Binding var showMenu: Bool
    @State private var showPickerModal = false
    
    var subviews = [
        
        UIHostingController(rootView: ContentView(text: "Page 1")),
        UIHostingController(rootView: ContentView(text: "Page 2")),
        UIHostingController(rootView: ContentView(text: "Page 3")),
        UIHostingController(rootView: ContentView(text: "Page 4"))
        
       ]
       
    var body: some View {
       
        VStack(alignment: .leading) {
            
            HStack {
                Button(action: {
                    withAnimation {
                           self.showMenu = true
                        }
                    }) {
                    HStack {
                        Image(systemName: "list.bullet")
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40)
                        .padding(5)
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }
            
            PSPageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
             
            HStack {
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                    .padding(5)
                Spacer()
                
                Button(action: {
                    if self.currentPageIndex+1 == self.subviews.count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContent()
                    .padding(5)
                }
            }
            .background(Color.black)
            
        }
        .background(Color.black)
        
    }
}



#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
#endif
