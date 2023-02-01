//
//  ContentView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 29/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {        
        
        
        TabView {
            
            
            PlanView()
                .tabItem {
                    Label("Planner", systemImage: "clock")
                }
            
            DepartureView()
                .tabItem{
                    Label("Departures", systemImage: "train.side.middle.car");
                }
            NearByView()
                .tabItem {
                    Label("Nearby me", systemImage: "mappin.and.ellipse");
                }
            MyTripsView()
                .tabItem {
                    Label("My trips", systemImage: "person.crop.circle");
                }
            MoreView()
                .tabItem {
                    Label("More", systemImage: "slider.horizontal.3")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

