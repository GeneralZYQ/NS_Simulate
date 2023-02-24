//
//  FavoriteTripsWidget.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 24/02/2023.
//

import SwiftUI

struct CityPair: Identifiable, Codable {
    var id = UUID()
    var startCity: City
    var desCity: City
}

struct FavoritePathCell: View {
    @State var cities: CityPair
    
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 0) {
                Text(cities.startCity.name)
                    .font(.body)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.leading, 20)
                Text(" to ")
                    .font(.body)
                    .foregroundColor(.blue)
                Text(cities.desCity.name)
                    .font(.body)
                    .bold()
                    .foregroundColor(.blue)
                Spacer()
            }
        }.buttonStyle(PlainButtonStyle())

    }
}

struct FavoriteTripsWidget: View {
    
    @State var paths: [CityPair] = [];
    
    var body: some View {
        ZStack {
            Color.gray
            GeometryReader { proxy in
                ZStack {
                    Color.white
                        .cornerRadius(5)
                        .padding(10)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("Plan Again ...")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .padding(10)
                                .frame(width:proxy.size.width - 20, height: 40, alignment: .leading)
                                .background(Color.white)
                            Spacer()
                        }
                        
                        ForEach(paths) { path in
                            FavoritePathCell(cities: path)
                            Divider()
                        }
                        
                        if paths.count <= 0 {
                            Button {
                                
                            } label: {
                                Text("Add Path")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .padding(10)
                                    .font(.subheadline)
                                    .frame(width:proxy.size.width - 20, height: 40, alignment: .leading)
                                    .background(.white)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        HStack(spacing: 0) {
                          
                           Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("...")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .padding(10)
                                    .font(.subheadline)
                                    .frame(height: 40, alignment: .trailing)
                                    .background(.white)
                            }
                            .buttonStyle(PlainButtonStyle())


                        }.padding(.leading, 10)
                         .padding(.trailing, 10)
                    }
                }
            }
        }.frame(height: 40 * CGFloat(paths.count) + 120)
    }
}

struct FavoriteTripsWidget_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTripsWidget(paths: [CityPair(startCity: City(name: "Haarlem", cityID: "1"), desCity: City(name: "Leiden", cityID: "3"))])
    }
}
