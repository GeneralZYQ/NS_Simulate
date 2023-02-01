//
//  DisruptionPromptView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 01/02/2023.
//

import SwiftUI

struct DisruptionPromptView: View {
    
    @State var disruptionCount: Int
    
    var body: some View {
        
//        Image(systemName: "chevron.right")
        GeometryReader { proxy in
            HStack {
                Image(systemName: "hand.point.up.braille.fill")
                    .foregroundColor(Color.blue)
//                    .padding(.leading, 3)
                Spacer().frame(width: 10)

                Text("Disruptions and engineering works(\(disruptionCount))")
                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(Color.blue)
            }
            .frame(width: proxy.size.width - 20, height: 30)
            .background(Color.yellow)
            .padding(.leading, 10)
            .padding(.trailing, 10)

        }
    }
}

struct DisruptionPromptView_Previews: PreviewProvider {
    static var previews: some View {
        DisruptionPromptView(disruptionCount: 3)
    }
}
