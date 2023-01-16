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
    @State private var dailyList = ["First", "Second"]
    
    func incList() {
        dailyList.insert("New", at: 0)
    }
    
    func incStress() {
        dailyList.insert("Stress Up", at: 0)
    }
    
    func incCoffee() {
        dailyList.insert("Get Some Coffee", at: 0)
    }
    
    func getRest() {
        dailyList.insert("REST", at: 0)
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
                    
                }
            }
            Spacer()
            Button("Get Stress") {
                print("")
                incStress()
            }
            .padding()
            
            Button("Go to Caffeine") {
                print("Click")
//                incList()
                incCoffee()
            }
            .padding()
            
            Spacer()
            
            Text("Bottom")
        }
        .padding()
        
    }
    
    
    var body: some View {
        ZStack {
            DailyView
            Buttons
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
