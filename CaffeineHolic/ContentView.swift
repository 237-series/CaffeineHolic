//
//  ContentView.swift
//  CaffeineHolic
//
//  Created by sglee237 on 2023/01/15.
//

import SwiftUI

struct Daily: Identifiable {
    let id = UUID()
    let title:String
}

struct ContentView: View {
    @State var caffeine:CaffeineModel = CaffeineModel()
    @State private var dailyList = ["First", "Second"]
    @State var result:Bool = true
    
    func incList() {
//        dailyList.insert("New", at: 0)
    }
    
    func incStress() {
//        dailyList.insert("Stress Up", at: 0)
        (result, dailyList) = caffeine.doStress()
    }
    
    func incCoffee() {
//        dailyList.insert("Get Some Coffee", at: 0)
        (result, dailyList) = caffeine.doWakening()
    }
    
    func getRest() {
//        dailyList.insert("REST", at: 0)
        (result, dailyList) = caffeine.doRest()
        
    }
    
    func resetState() {
        (result, dailyList) = caffeine.doReset()
    }
    
    var DailyView: some View {
        // Daily History area
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20)  {
                List(dailyList, id: \.self) {item in
                    Text(item)
                }
                Spacer()
                Text("") // End of Daily Item List
            }
            .frame(width: 200)
            .opacity(0.3)
            Spacer()
        }
        .padding()
    }
    
    var Buttons: some View {
        VStack {
            // Top buttons
            HStack(spacing: 20){
                Text("")
                Spacer()
//                Text("Top Button")
                Button("Top Button") {
                    print("Top Button Click")
                    //resetState()
                    (result, dailyList) = caffeine.doReset()
                }
            }
            .padding()
            Spacer()
            
            
            Spacer()
            
            HStack {
                Button("Get Stress") {
                    print("")
    //               incStress()
                    (result, dailyList) = caffeine.doStress()
                }
                .padding()
                
                Button("Go to Caffeine") {
                    print("Click")
    //                incList()
                    incCoffee()
                }
                .padding()
                
                Button("Get Some Rest") {
                    getRest()
                }.padding()
                
            }
//            Text("Bottom")
        }
        .padding()
        
    }
    
    var Images: some View {
        VStack {
            Button(action: {
                (result, dailyList) = caffeine.doSame()}
            ) {
                Image(caffeine.getStateImg())
                    .resizable()
                    .frame(width: caffeine.imgFrame.width, height: caffeine.imgFrame.height)
            }
            
        }
    }
    
    
    var body: some View {
        ZStack {
            DailyView
            Images
            Buttons
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
