//
//  CardWidget.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 24/02/2023.
//

import SwiftUI

struct Card : Identifiable, Codable {
    var id = UUID()
    var cardNumber: String
    var cardBalance: CGFloat
    var checkInTime: String
    var checkOutTime: String
    var holderName: String
}

struct CardWidget: View {
    
    @State var card: Card
    
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CardWidget_Previews: PreviewProvider {
    static var previews: some View {
        CardWidget(card: Card(cardNumber: "1234 5678 1234 5678", cardBalance: 34.11, checkInTime: "2022-10-10 14:34 Thu", checkOutTime: "2022-10-10 15:33 Thu", holderName: "Smith Haar"))
    }
}
