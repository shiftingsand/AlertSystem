//
//  ContentView.swift
//  AlertSystem
//
//  Created by Chris Wu on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var theAlert = AlertSystem.shared
    
    var body: some View {
        VStack {
            Button("Show Turtles") {
                theAlert.alertToShow = .iLikeTurtles
            }
            .padding(.bottom)
            Button("Show Duplicate") {
                theAlert.alertToShow = .generalDupName(theDuplicateName: "pickle")
            }
        }
        .alert(item: $theAlert.alertToShow, content: { oneThing in
            oneThing.makeAlert()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
