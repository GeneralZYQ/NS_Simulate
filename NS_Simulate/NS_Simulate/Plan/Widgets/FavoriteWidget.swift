//
//  FavoriteWidget.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 24/02/2023.
//

import SwiftUI

struct City : Identifiable, Codable {
    var id = UUID()
    var name: String
    var cityID: String
}

struct FavoriteCell: View {
    
    var city: City
    
    init(city: City) {
        self.city = city
    }
    
    var body: some View {
        
        ZStack {
            Color.white
            HStack {
                Image(systemName: "car")
                  .frame(width: 20, height: 20)
                  .foregroundColor(.white)
                  .padding(5)
                  .background(Color.gray)
                  .clipShape(Circle())
                
                Text(city.name)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.blue)


                Spacer()
            }.padding(.leading, 10)
        }.padding(.leading, 10)
        .padding(.trailing, 10)
        .frame(height: 50)
            
    }
}

struct FavoriteWidget: View {
    
    var favorites : [City] = [];
    
    var body: some View {
        ZStack {
            Color.gray
             GeometryReader { proxy in
                 
                 VStack(spacing:0) {
                     
                     HStack {
                         Spacer()
                         Text("Favorites")
                             .font(.title2)
                             .foregroundColor(.blue)
                             .padding(10)
                             .frame(width:proxy.size.width - 20, height: 40, alignment: .leading)
                              .background(Color.white)
                         Spacer()
                     }
                     
                     Color.white.frame(width:proxy.size.width - 20, height: 5)
                     
                     ForEach(favorites) { city in
                         FavoriteCell(city: city)
                     }
                     
                     if favorites.count <= 0 {
                         Button {
                             
                         } label: {
                             Text("Add Favorite")
                                 .foregroundColor(.blue)
                                 .bold()
                                 .padding(10)
                                 .font(.subheadline)
                                 .frame(width:proxy.size.width - 20, height: 40, alignment: .leading)
                                 .background(.white)
                         }
                         .buttonStyle(PlainButtonStyle())
                     }
                     
                     Divider().padding(.leading,10)
                     
                     HStack(spacing: 0) {
                         Button {
                             
                         } label: {
                             Text("Add Favorite")
                                 .foregroundColor(.blue)
                                 .bold()
                                 .padding(10)
                                 .font(.subheadline)
                                 .frame(height: 40, alignment: .leading)
                                 .background(.white)
                         }
                         .buttonStyle(PlainButtonStyle())
                         
                         Color.white.frame(height: 40)
                         
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
                 }.cornerRadius(20)
                 .padding(.top, 15)
                  .padding(.bottom, 15)
                  
                  
             }
        }.frame(height: 115 + CGFloat(favorites.count * 50))
        
        
    }
}

struct FavoriteWidget_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteWidget(favorites: [City(name: "Haarlem", cityID: "1"), City(name: "Amsterdam RAI", cityID: "2"), City(name: "Leiden", cityID: "3")])
        //
    }
}
