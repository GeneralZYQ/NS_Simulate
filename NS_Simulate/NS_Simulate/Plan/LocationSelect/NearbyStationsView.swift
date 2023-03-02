//
//  NearbyStationsView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct NearbyStationsView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(spacing: 30) {
                Image(systemName: "car")
                    .foregroundColor(.blue)
                    .overlay(
                        Circle().stroke(.blue, lineWidth: 1)
                            .scaleEffect(1.6)
                        
                    )
                    .scaleEffect(2.3)
                
                    
                Text("Haarlem")
                    .font(.title2)
                    .foregroundColor(.blue)
                    
            }
        }
    }
}

struct NearbyStationsView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyStationsView()
    }
}
