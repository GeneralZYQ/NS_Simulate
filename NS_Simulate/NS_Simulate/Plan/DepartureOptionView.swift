//
//  DepartureOptionView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 31/01/2023.
//

import SwiftUI

struct DepartureTimeView: View {
    var body: some View {
        
        GeometryReader { proxy in
            
            Button {
                
            } label: {
                HStack(spacing: 2) {
                    Text("Departure: ")
                        .font(.title3)
                        .bold()
                        .padding(.leading, 10)
                        .foregroundColor(Color.blue)
                    Text("now")
                        .font(.body)
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                
                .frame(width: proxy.size.width, height: proxy.size.height)
                .background(Color.white)
                .cornerRadius(5)
            }.buttonStyle(PlainButtonStyle())
        }

    }
}

struct OptionButton: View {
    var body: some View {
        GeometryReader { proxy in
            Button {
                
            } label: {
                
                ZStack {
                    
                    Color.gray.opacity(0.2)
                    Color.yellow.opacity(0.2)
                    
                    HStack {
                        Spacer()
                        Text("Options")
                            .bold()
                            .foregroundColor(Color.blue)
                            .font(.title2)
                        Spacer()
                    }
                    
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
                
                
                
            }.buttonStyle(PlainButtonStyle())
            .cornerRadius(5)
//                .background(Color.red)

        }
    }
}

struct DepartureOptionView: View {
    var body: some View {
        ZStack {
            Color.clear
            
            GeometryReader { proxy in
                
                HStack(spacing: 0) {
                    DepartureTimeView()
                        .frame(width: (proxy.size.width - 30) * 2.0 / 3.0, height: proxy.size.height)
                    
                    Color.yellow.frame(width: 10)
                    
                    OptionButton()
                }
            }
            
            
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .background(Color.clear)
            .frame(height: 45)
    }
}

struct DepartureOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DepartureOptionView()
    }
}
