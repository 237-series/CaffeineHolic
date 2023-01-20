//
//  CoffeineModel.swift
//  CaffeineHolic
//
//  Created by sglee237 on 2023/01/16.
//

import Foundation

enum CaffeineState: String {
    case Intro
    case Wakening
    case Stressful
    case Rest
}

struct dailyItem {
    var state:CaffeineState = .Intro
    var count:Int = 0
}

class CaffeineModel {
    
    var currentState:CaffeineState = CaffeineState.Intro
    var imgFrame:CGSize = CGSize(width: 200.0, height: 200.0)
    
    
    let originList = ["First", "Second"]
    var dailyList:[dailyItem] = []
    
    
    
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
        
        var daily:dailyItem = .init()
        daily.state = state
        daily.count = 0
        
        if dailyList.count == 0 {
//            dailyList.insert(state.rawValue, at: 0)
            dailyList.insert(daily, at: 0)
            return
        }
        
        var item = dailyList.removeFirst()
//        var name = state.rawValue
        if item.state == state {
            item.count += 1
            dailyList.insert(item, at: 0)
        }
        else {
            dailyList.insert(item, at: 0)
            dailyList.insert(daily, at: 0)
//            dailyList.insert(state.rawValue, at: 0)
        }
        
        
        //dailyList.insert(name, at: 0)
//
//        switch(state) {
//        case .Stressful: dailyList.insert("Stress Up", at: 0);
//        case .Wakening: dailyList.insert("Get Some Coffee", at: 0);
//        case .Intro: dailyList.insert("New", at: 0);
//        case .Rest: dailyList.insert("REST", at: 0);
//        }
    }
    
    private func changeState(newState:CaffeineState) -> (Bool, [dailyItem]) {
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
    
    func doSame() ->(Bool, [dailyItem]) {
        if currentState == .Intro {
            return (false, dailyList)
        }
        return changeState(newState: currentState)
    }
    
    func doReset() ->(Bool, [dailyItem]) {
        if currentState == .Intro {
            return (false, dailyList)
        }
        return changeState(newState: .Intro)
    }
    
    func doWakening() -> (Bool, [dailyItem]){
//        self.currentState = CaffeineState.Wakening
        return changeState(newState: .Wakening)
    }
    
    func doStress() ->(Bool, [dailyItem]){
//        self.currentState = CaffeineState.Stressful
        return changeState(newState: .Stressful)
    }
    
    func doRest() ->(Bool, [dailyItem]){
        return changeState(newState: .Rest)
//        self.currentState = CaffeineState.Rest
    }
    
    
    
    
}
