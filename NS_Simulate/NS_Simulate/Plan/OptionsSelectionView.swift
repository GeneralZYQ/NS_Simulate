//
//  OptionsSelectionView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 19/04/2023.
//

import SwiftUI

struct TransTypeButton : View {
    
    @EnvironmentObject var options : Options
    
    var body: some View {
        
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Departure")
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                    Text("Public")
                        .font(.body)
                        .foregroundColor(.blue)
                }.padding(.leading, 15)
                
                Spacer()
                
                Image(systemName: "bus").padding(.trailing, 20)
            }
            
            Button {
                
            } label: {
//                Color.yellow
                //todo: action
            }

        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight:55, maxHeight: 75)
        .background(.gray)
            
    }
}

struct TransTypesView: View {
    var body: some View {
        HStack(spacing: 0) {
            TransTypeButton()
                .cornerRadius(5)
                .padding(.trailing, 5)
                .padding(.leading, 5)
            TransTypeButton()
                .cornerRadius(5)
                .padding(.trailing, 5)
                .padding(.leading, 5)
                
                
        }.padding(.top, 20)
    }
}

struct PublicTypeChooseView: View {
    
    
    var set_type : PublicTransportType
    @Binding var chosen_types : [PublicTransportType]
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image(systemName: imagify_type(type: set_type))
            Text(stringify_type(type:set_type))
                .font(.caption)
        }.frame(width: 200, height: 100)
        .border(.blue, width: 3)
        .cornerRadius(5)
        .onTapGesture {
            print("\(chosen_types.count)")
        }
    }
    
    func stringify_type(type: PublicTransportType)->String {
        
        switch type {
        case PublicTransportType.Train:
            return "Train"
            
        case PublicTransportType.Bus:
            return "Bus"
            
        case PublicTransportType.Subway:
            return "Subway"
            
        case PublicTransportType.Tram:
            return "Tram"
            
        case PublicTransportType.Ferry:
            return "Ferry"
        }
    }
    
    func imagify_type(type: PublicTransportType)->String {
        
        switch type {
            case PublicTransportType.Train:
                return "train.side.middle.car"
            case .Bus:
                return "bus"
            case .Subway:
                return "m.square"
            case .Tram:
                return "tram"
            case .Ferry:
                return "ferry"
        }
    }
}


struct OptionsSelectionView: View {
    
    @EnvironmentObject var options : Options
    
    let public_trans_type = [PublicTransportType.Train, PublicTransportType.Bus, PublicTransportType.Subway, PublicTransportType.Tram, PublicTransportType.Ferry]

    @State var ini_public_types : [PublicTransportType]
    
//    init(ini_public_types: Array<PublicTransportType> = []) {
//
//        self.ini_public_types = options.publics
//    }
    
//    init() {
//
//        _ini_public_types = State(initialValue: options.publics)
//    }
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                Color.yellow
                
                HStack(alignment: .center) {
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }.padding()
                    
                    Spacer()
                    
                    Text("Travel options")
                        .font(.title3)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Save")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }.padding()


                }
            }.frame(height: 55)
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    TransTypesView()
                    
                    Divider().padding(.top, 10)
                    Group {
                        Text("Public transport")
                            .font(.body)
                            .bold(true)
                            .foregroundColor(.blue)
                            .padding(.leading, 5)
                            .padding(.top, 10)
                        
                        PublicTypeChooseView(set_type: .Train, chosen_types: $ini_public_types)
                            
                            
//                        ForEach(fetch_current_type(), id:\.self) { item in
//                            Text("abc")
//                        }
                    }
                    
                    
                    
                    
                    Spacer()
                }
                
            }
            
            
           
        }
        
    }
    
//    func fetch_current_type()->Array<PublicTransportType> {
//
//        return options.publics
//    }
}

struct OptionsSelectionView_Previews: PreviewProvider {
    
    static let options = Options()
    
    static var previews: some View {
        OptionsSelectionView(ini_public_types: options.publics).environmentObject(options)
    }
}
