//
//  PlanDepartDestiView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 31/01/2023.
//

import SwiftUI

struct departureAndDestinationIcon: View {
    
    var body: some View {
        VStack(spacing: -1.0) {
            
            Image(systemName: "circle")
                .scaleEffect(0.8)
                .background(Color.white)
                .foregroundColor(Color.blue)
                .padding(.top, 10)
            Color.blue
                .scaleEffect(1.14)
                .foregroundColor(Color.blue)
                .frame(width: 2.0)
            Image(systemName: "circle")
                .scaleEffect(0.8)
                .foregroundColor(Color.blue)
                .padding(.bottom, 10)
            
        }
    }
}

struct departureAndDestinationButtons : View {
    
    @Binding var departure: City
    @Binding var destination: City
//    @State var selectDepar : Bool
    
    @State private var showingDepartureList = false
    @State private var showingDestinationList = false
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack(alignment: .leading ,spacing: 0.0) {
                Button {
                    showingDepartureList = true
                } label: {
                    Text(self.departure.name)
                        .font(.subheadline)
                        .bold()
                        .frame(height: proxy.size.height / 2.0)
                        
                    Spacer()
                        
                }
                .frame(width: proxy.size.width)
                .background(Color.white)
                .sheet(isPresented: $showingDepartureList) {
                    
                    LocationSelectView(departureCity: $departure, destinationCity: $destination, selectDepar: true)
                }
                
                
                Divider()
                    .frame(width:  proxy.size.width )
                
                Button {
                    showingDestinationList = true
                } label: {
                    Text(self.destination.name)
                        .font(.subheadline)
                        .bold()
                        .frame(height: proxy.size.height / 2.0)
                    Spacer()
                }
                .frame(width: proxy.size.width)
                .background(Color.white)
                .sheet(isPresented: $showingDestinationList) {
                    LocationSelectView(departureCity: $departure, destinationCity: $destination, selectDepar: false)
                }

            }
        }
    }
}

struct switchButtonView : View {
    
    @Binding var departure: City
    @Binding var destination: City
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                
                let radius = min(proxy.size.width, proxy.size.height) / 2.0
                
                Button {
                    switch_cities()
                } label: {
                    Spacer()
                    
                    ZStack {
                        
                        Circle()
                            .strokeBorder(Color.blue, lineWidth: 1)
                            .background(Color.clear)
                            .foregroundColor(Color.clear)
                            .frame(width: radius, height: radius)
                        
                        Image(systemName: "arrow.up.arrow.down")
                            .frame(width: radius, height: radius)
                    }
                    
                    
                        
                    Spacer()
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
                .background(Color.white)

            }
        }
    }
    
    func switch_cities() {
        print("abccc")
        swap(&departure, &destination)
    }
}

struct PlanDepartDestiView: View {
    
    @State var departure = City(name: "Amsterdam", cityID: "a123")
    @State var destination = City(name: "Leiden", cityID: "l123")
    
    
    var body: some View {
        
        
            ZStack {
                Color.white
                    
                GeometryReader { proxy in
                    
                    HStack(spacing: 0.0) {
                        departureAndDestinationIcon().frame(width: proxy.size.width / 10.0, height: proxy.size.height)
                            .background(Color.white)
                            .padding(.leading, 0)
                        
                        departureAndDestinationButtons(departure: $departure, destination: $destination)
                            .frame(width: proxy.size.width - proxy.size.width / 8.0 - 100.0 , height: proxy.size.height )
                            .background(Color.white)
                        
                        
                        switchButtonView(departure: $departure, destination: $destination)
                            .frame(height: proxy.size.height)
                            
                    }
                    .background(Color.red)
                }
            
            }
            .cornerRadius(10)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .background(Color.yellow)
                .frame(height: 80)
                
                
        
        
    }
}

struct PlanDepartDestiView_Previews: PreviewProvider {
    static var previews: some View {
        PlanDepartDestiView()
    }
}
