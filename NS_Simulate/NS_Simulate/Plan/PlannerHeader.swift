//
//  PlannerHeader.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 30/01/2023.
//

import Foundation
import SwiftUI


struct PlannerHeader : View {
    
    @Binding var outSideOffset: CGFloat;
    
    private func iconScale(offset: CGFloat)->Double {
        if(offset >= -70 && offset < 0) {
            let scale = (3.0/700.0) * offset + 1.0
            return scale
        } else if (offset < -70) {
            return 0.7
        } else {
            return 1.0
        }
    }
    
    private func textScale(offset: CGFloat)->Double {
        
        if (offset >= -20.0 && offset < 0.0) {
            return ((20.0 + offset) / 20.0) + 0.01
        } else if (offset >= 0) {
            return 1.0
        } else {
            return 0.01
        }
    }
    
    var body: some View {
        
        ZStack {
                Color.yellow;
            
            VStack {
                
                Image(systemName: "arrow.left.and.line.vertical.and.arrow.right")
                    .scaleEffect(self.iconScale(offset: outSideOffset))
                    .padding(.top, 70)
                Spacer()
                Text("Welcome to this board!")
                    .scaleEffect(self.textScale(offset: outSideOffset))
            }
        }
       
    }
}
