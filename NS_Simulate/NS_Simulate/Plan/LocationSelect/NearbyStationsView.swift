//
//  NearbyStationsView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct NearbyStationsView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            
            Spacer()
            VStack(spacing: 30) {
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Circle()
                            .stroke(.blue, lineWidth: 1)
                            .frame(width: 80, height: 80)
                            
                    )
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                
                    
                Text("Haarlem")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .frame(maxWidth: 120)
                    .foregroundColor(.blue)
                    
            }
            
            Group {
                Spacer()
                
                Color.gray.frame(width: 1, height: 80)
                    .padding(.top, -20)
                Spacer()
            }
            
            
            
            VStack(spacing: 30) {
                
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Circle()
                            .stroke(.blue, lineWidth: 1)
                            .frame(width: 80, height: 80)
                            
                    )
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                
                    
                Text("Bloemendaal")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .frame(maxWidth: 120)
                    .foregroundColor(.blue)
                    
            }.padding(.top, 0)
            
            Group {
                Spacer()
                    
                Color.gray.frame(width: 1, height: 80)
                    .padding(.top, -20)
                
                Spacer()
            }
            
            
            
            VStack(spacing: 25) {
                
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Circle()
                            .stroke(.blue, lineWidth: 1)
                            .frame(width: 80, height: 80)
                            
                    )
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                
                    
                Text("Amsterdam Sloterdijk")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .frame(maxWidth: 120, maxHeight: 50)
                    .foregroundColor(.blue)
                    
            }
            
            Spacer()
                
            
        }
        .frame(height: 160)
        .background(.white)
    }
}

struct NearbyStationsView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyStationsView()
    }
}
