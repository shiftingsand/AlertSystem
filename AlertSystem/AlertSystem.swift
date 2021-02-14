//
//  AlertSystem.swift
//  An example of the alert system I'm trying out. I did NOT come up with the idea for the class and enum.
//  It is based off of code from Thomas Ricouard. I changed it to deal with alerts instead of Views.
//
// https://github.com/Dimillian/ACHNBrowserUI/blob/main/ACHNBrowserUI/ACHNBrowserUI/env/UIState.swift
//
//
//  Created by Chris Wu on 2/14/21.

import Foundation
import SwiftUI

class AlertSystem : ObservableObject {
    public static let shared = AlertSystem()
    
    enum AlertToShow : Identifiable {
        case generalEmptyName
        case generalDupName(theDuplicateName : String)
        case iLikeTurtles
        
        var id : String {
            switch self {
                case .generalEmptyName:
                    return "generalEmptyName"
                case .generalDupName(_):
                    return "generalDupName"
                case .iLikeTurtles:
                    return "iLikeTurtles"
            }
        }
        
        func makeAlert() -> Alert {
            var textToUse = ""
            
            switch self {
                case .generalEmptyName:
                    textToUse = "No name entered."
                case .generalDupName(theDuplicateName: let theDup):
                    textToUse = "\"\(theDup)\" is already in use. Please pick another name."
                case .iLikeTurtles:
                    textToUse = "I like turtles. 🐢"
            }
            
            return Alert(title: Text("Error!"), message: Text(textToUse), dismissButton: .default(Text("OK")))
        }
    }
    
    @Published var alertToShow : AlertToShow?
}
