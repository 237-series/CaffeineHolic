//
//  CoffeineModel.swift
//  CaffeineHolic
//
//  Created by sglee237 on 2023/01/16.
//

import Foundation

class CaffeineModel {
    enum CaffeineState: String {
        case Intro
        case Wakening
        case Stressful
        case Rest
    }
    
    var currentState:CaffeineState = CaffeineState.Intro
    var imgFrame:CGSize = CGSize(width: 200.0, height: 200.0)
    
    
    let originList = ["First", "Second"]
    var dailyList:[String] = []
    
    
    
    func getStateImg () -> String {
        return "Profile." + currentState.rawValue
//        switch(currentState) {
//        case .Intro:
//            return "Profile.Intro"
//
//        case .Rest:
//            return "Profile.Rest"
//        case .Stressful:
//            return "Profile.Stressful"
//        case .Wakening:
//            return "Profile.Wakening"
////        default:
////            return "Profile.Intro"
////
//        }
    }
    
    func incImgSize() {
        var newFrame:CGSize = imgFrame
        newFrame.height += 10
        newFrame.width += 10
        if newFrame.height < 350 {
            imgFrame = newFrame
        }
    }
    
    func resetImgSize() {
        imgFrame = CGSize(width: 200.0, height: 200.0)
    }
    
    
    private func addDailyList(state:CaffeineState) {
        switch(state) {
        case .Stressful: dailyList.insert("Stress Up", at: 0);
        case .Wakening: dailyList.insert("Get Some Coffee", at: 0);
        case .Intro: dailyList.insert("New", at: 0);
        case .Rest: dailyList.insert("REST", at: 0);
        }
    }
    
    private func changeState(newState:CaffeineState) -> (Bool, [String]) {
        var result:Bool = false
        //var returnList:[String] = []
        
        addDailyList(state: newState)
        if newState != self.currentState {
            result = true
            self.currentState = newState
            resetImgSize()
        }
        
        // Bigger Img Size
        else {
            incImgSize()
        }
        
        return (result, dailyList)
    }
    
    
    func doReset() ->(Bool, [String]) {
        return changeState(newState: .Intro)
    }
    
    func doWakening() -> (Bool, [String]){
//        self.currentState = CaffeineState.Wakening
        return changeState(newState: .Wakening)
    }
    
    func doStress() ->(Bool, [String]){
//        self.currentState = CaffeineState.Stressful
        return changeState(newState: .Stressful)
    }
    
    func doRest() ->(Bool, [String]){
        return changeState(newState: .Rest)
//        self.currentState = CaffeineState.Rest
    }
    
    
    
    
}
