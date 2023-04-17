//
//  CurrentLocationView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct CurrentLocationView: View {
    
    @Binding var departureCity: City
    @Binding var destCity: City
    public var selectdepar: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "arrow.up.forward.circle")
                .frame(width: 60)
                .foregroundColor(.blue)
            
           
            
            VStack (alignment: .leading) {
                Text("Nearby location")
                    
                Text("Haarlem")
            }
            
            Spacer()
            
            Color.gray.frame(width: 1, height: 20)
            
            Image(systemName: "map")
                .frame(width: 40)
                .foregroundColor(.blue)
                
        }.onTapGesture {
            if selectdepar {
                departureCity = City(name: "Haarlem", cityID: "h1234")
            } else {
                destCity = City(name: "Haarlem", cityID: "h1234")
            }
            
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

//struct CurrentLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentLocationView()
//    }
//}
