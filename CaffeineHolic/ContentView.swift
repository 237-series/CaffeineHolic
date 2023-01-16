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
                Text("Top Button")
            }
            Spacer()
            Button("Go to Caffeine") {
                print("Click")
                incList()
            }
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
