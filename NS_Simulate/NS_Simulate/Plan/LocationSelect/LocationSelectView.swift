//
//  LocationSelectView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct LocationSelectView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var searchingText: String = ""
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.yellow
                HStack {
                    TextField("  Where does your trip begin?", text: $searchingText)
                        .frame(height: 45)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(.leading, 10)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                    }
                    .frame(height: 45)
                    .padding(.trailing, 10)

                }
                
            }
            
            Spacer()
        }
    }
}

struct LocationSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelectView()
    }
}
