//
//  NearbyStationsView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct NearbyStationsView: View {
    
    private var circleDemester = 60.0
    private var carDemester = 40.0
    private var icon_top = 20.0
    
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
                            .frame(width: circleDemester, height: circleDemester)
                            
                    )
                    .frame(width: carDemester, height: carDemester)
                    .foregroundColor(.blue)
                
                    
                Text("Haarlem")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .frame(maxWidth: 120)
                    .foregroundColor(.blue)
                    
            }.padding(.top, icon_top)
            
            Group {
                Spacer()
                
                Color.gray.frame(width: 1, height: 80)
                    .padding(.top, 0)
                Spacer()
            }
            
            
            
            VStack(spacing: 30) {
                
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Circle()
                            .stroke(.blue, lineWidth: 1)
                            .frame(width: circleDemester, height: circleDemester)
                            
                    )
                    .frame(width: carDemester, height: carDemester)
                    .foregroundColor(.blue)
                
                    
                Text("Bloemendaal")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .frame(maxWidth: 120)
                    .foregroundColor(.blue)
                    
            }.padding(.top, 20)
            
            Group {
                Spacer()
                    
                Color.gray.frame(width: 1, height: 80)
                    .padding(.top, 0)
                
                Spacer()
            }
            
            
            
            VStack(spacing: 25) {
                
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Circle()
                            .stroke(.blue, lineWidth: 1)
                            .frame(width: circleDemester, height: circleDemester)
                            
                    )
                    .frame(width: carDemester, height: carDemester)
                    .foregroundColor(.blue)
                
                    
                Text("Amsterdam Sloterdijk")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .frame(maxWidth: 120, maxHeight: 50)
                    .foregroundColor(.blue)
                    
            }.padding(.top, icon_top)
            
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
