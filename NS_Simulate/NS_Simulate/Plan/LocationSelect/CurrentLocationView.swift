//
//  CurrentLocationView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct CurrentLocationView: View {
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "arrow.up.forward.circle")
                .frame(width: 60)
                .foregroundColor(.blue)
            
           
            
            VStack (alignment: .leading) {
                Text("Nearby location")
                    
                Text("Haarlem General Conjel 33")
            }
            
            Spacer()
            
            Color.gray.frame(width: 1, height: 20)
            
            Image(systemName: "map")
                .frame(width: 40)
                .foregroundColor(.blue)
                
        }.background(.white)
    }
}

struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
    }
}
