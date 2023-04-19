//
//  OptionsObject.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 19/04/2023.
//

import Foundation

enum TransportType {
    case Walk
    case Bike
    case OVFiets
    case PublicTransport
    case Car
}

enum PublicTransportType {
    case Train
    case Bus
    case Subway
    case Tram
    case Ferry
}

//enum OptionPreferenceType {
//    case sprinterOnly
//    case HideTrain
//    case ShowAccessible
//}

class Options: ObservableObject {
    @Published var departureTransportation = TransportType.PublicTransport
    @Published var arrivalTransportation = TransportType.PublicTransport
    @Published var publics = [PublicTransportType.Train, PublicTransportType.Bus, PublicTransportType.Subway, PublicTransportType.Tram, PublicTransportType.Ferry]
    @Published var viaStation = "Heisen"
    @Published var preferences = ["sprinterOnly": false, "hideTrain": false, "showAccesible": false]
    @Published var additionalTime = 0
}
