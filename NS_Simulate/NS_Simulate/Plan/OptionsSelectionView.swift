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
        }.frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: 150)
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

struct viaStationTextfield : View {
    
    @Binding var viaCity: String
    
    var body: some View {
        HStack {
            
            Text(viaCity)
                .padding()
            
            Spacer()
            
            if ((viaCity.count) != 0) {
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                }.padding()
            }
        }
        .border(.gray, width: 2)
        .cornerRadius(5)
        .padding(.leading, 5)
        .padding(.trailing, 5)
        .onTapGesture {
            print("text")
        }
    }
}


struct OptionsSelectionView: View {
    
    @EnvironmentObject var options : Options
    
    let public_trans_type = [PublicTransportType.Train, PublicTransportType.Bus, PublicTransportType.Subway, PublicTransportType.Tram, PublicTransportType.Ferry]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var ini_public_types : [PublicTransportType] = [PublicTransportType.Train]
    
    @State private var stationName = ""
    
    @State private var onlySprinters = false
    @State private var hidetrains = false
    @State private var onlyAccesibleJournies = false
    
    
    
    
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
                        .foregroundColor(.blue)
                    
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
                        
                        Text("Choose at least one type of public transport")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                            .padding(.top, 1)
                        
//                        PublicTypeChooseView(set_type: .Train, chosen_types: $ini_public_types)
                            
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(public_trans_type, id: \.self) { item in
                                PublicTypeChooseView(set_type: item, chosen_types: $ini_public_types)
                                
                            }
                        }.padding(.leading, 5)
                        .padding(.trailing, 5)

                    }
                    
                    Group {
                        Text("Via Station")
                            .font(.body)
                            .bold(true)
                            .foregroundColor(.blue)
                            .padding(.leading, 5)
                            .padding(.top, 10)
                        
                        viaStationTextfield(viaCity: $stationName)
                        
                        
//                        TextField("Station", text: $stationName) { editing in
//                            if editing {
//                                print("ediitng")
//                            } else {
//                                print("not editing")
//                            }
//                        }.textFieldStyle(.roundedBorder)
//                            .padding(.leading, 5)
//                            .padding(.trailing, 5)
                            
                        
                    }
                    
                    Divider().padding(.top, 10)
                    
                    Group {
                        
                        Text("Preferences")
                            .font(.body)
                            .bold(true)
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                        
                        Toggle("Show sprinters only", isOn: $onlySprinters)
                            .foregroundColor(.blue).font(.subheadline)
                        
                        Toggle("Hide Trains with required reservation", isOn: $hidetrains)
                            .foregroundColor(.blue)
                            .font(.subheadline)
                        
                        Toggle("Show only accesible journeys", isOn: $onlyAccesibleJournies)
                            .foregroundColor(.blue)
                            .font(.subheadline)
                        
                        Text("""
· You are travelling with an aid, like wheelchair
· You want to know where you can independently embark and disembark the train or request to get NS Travel-assistance
· You will only get information about accessible journeys with NS trains
""").foregroundColor(.gray)
                            .font(.caption2)
                        
//                        HStack {
//
//                            Text("Show sprinters only")
//                                .font(.caption2)
//                                .padding(.top, 2)
//                                .foregroundColor(.gray)
//
//
//                        }
                    }.padding(.leading, 5)
                        .padding(.trailing, 5)
                    
                    
                    
                    
                    
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
        OptionsSelectionView().environmentObject(options)
    }
}
