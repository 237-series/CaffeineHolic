//
//  CoffeineModel.swift
//  CaffeineHolic
//
//  Created by sglee237 on 2023/01/16.
//

import Foundation

class CaffeineModel {
    enum CaffeineState {
        case Intro
        case wakening
        case stressful
        case rest
    }
    
    var currentState:CaffeineState = CaffeineState.Intro
    
    func getStateImg () -> String {
        switch(currentState) {
        case .Intro:
            return "Profile.Intro"
        default:
            return "Profile.Intro"
        
        }
    }
    
    
    
}
