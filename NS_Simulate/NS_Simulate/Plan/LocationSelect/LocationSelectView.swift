//
//  LocationSelectView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 02/03/2023.
//

import SwiftUI

struct HistoryCellView: View {
    
    var city: City
    
    var body: some View {
        HStack {
            Image(systemName: "clock")
                .padding(.leading, 5)
            VStack(alignment: .leading){
                Text(city.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 2, trailing: 0))
                Text("station")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 2, leading: 5, bottom: 5, trailing: 0))
            }
        }
    }
}

struct SearchedCellView: View {
    
    var city: City
    
    @State private var showingOptions = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            
            HStack {
                
                Image(systemName: "bus.doubledecker.fill")
                
                VStack(alignment: .leading) {
                    Text(city.name)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0))
                    Text("station")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
                }
            }.padding(.leading, 10)
            
            
            
            Spacer()
            
            Button {
                self.showingOptions = true
            } label: {
                Text("···")
            }.actionSheet(isPresented: $showingOptions) {
                ActionSheet(title: Text("Add to favorite?").font(.system(.largeTitle)),
                buttons: [
                    .default(Text("ADD")) {
                        //This city go to favorites
                    },
                    .cancel(Text("Cancel")) {
                        
                    },
                ])
            }.padding(.trailing, 10)
        }
    }
}

struct LocationSelectView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var searchingText: String = ""
    @Binding var departureCity : City
    @Binding var destinationCity: City
    public var selectDepar : Bool
    
    var history_cities : [City] = [City(name: "Arhnem", cityID: "ar123"), City(name: "Alphen aan rijn", cityID: "al122"), City(name: "Gouda", cityID: "g122")]
    @State private var searchedCities : [City] = []
    
    let fakeCities = [City(name: "Ark", cityID: "a10"), City(name: "Beverwijk", cityID: "b01"), City(name: "Castrium", cityID: "c91"), City(name: "Den haag", cityID: "d91")];

    func searchCities(sc: String) {
        searchedCities = fakeCities.filter{ $0.name.contains(sc) }
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                ZStack {
                    
                    Color.yellow
                    
                        HStack {
                            TextField("  Where does your trip begin?", text: $searchingText)
                                .frame(height: 45)
                                .background(Color.white)
                                .cornerRadius(5)
                                .padding(.leading, 10)
                                .onChange(of: searchingText) { newValue in
//                                    print(newValue)
                                    if newValue.count > 0 {
                                        searchCities(sc: newValue)
                                    }
                                    
                                }
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Cancel")
                                    .font(.subheadline)
                            }
                            .frame(height: 45)
                            .padding(.trailing, 10)

                        }
                    
                }.frame(height: 65)
                
                
                if searchingText.count <= 0 {
                    
                    List() {
                        
                        CurrentLocationView(departureCity: $departureCity, destCity: $destinationCity, selectdepar: selectDepar)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())

    //                    Color.yellow
    //                        .listRowInsets(EdgeInsets())
                        
                        Section(header: HStack {

                            ZStack {
                                Color.gray.opacity(0.2)
                                HStack {
                                    Text("Nearby stations")
                                        .padding(.top, 20)
                                        .foregroundColor(.gray)
                                      .font(.system(size: 14))

                                    Spacer()
                                }

                            }.padding(.top, -20)

                          }) {

                              NearbyStationsView(departureCity: $departureCity, destCity: $destinationCity, selectdepar: selectDepar)

                          }
                          .listRowInsets(EdgeInsets())
                        
                        
                        Section {
                            ForEach(history_cities) { city in
                                HistoryCellView(city: city)
                                    .onTapGesture {
    //                                    print(city.name)
                                        selectedCity(city: city)
//                                        if selectDepar {
//                                            departureCity = city
//                                        } else {
//                                            destinationCity = city
//                                        }
//
//                                        presentationMode.wrappedValue.dismiss()
                                    }
                            }
                        } header: {
                            ZStack {
                                Color.gray.opacity(0.2)
                                HStack {
                                    Text("History")
                                        .padding(.top, 20)
                                        .foregroundColor(.gray)
                                      .font(.system(size: 14))

                                    Spacer()
                                }

                            }.padding(.top, -20)
                               
                        }.listRowInsets(EdgeInsets())

                        
                    }
                    .listStyle(PlainListStyle())
                    
                } else { // When the searching text is longer than 0
//                    print("\(searchingText)")
                    
                    ForEach(searchedCities) { city in
                        SearchedCellView(city: city)
                            .onTapGesture {
                                selectedCity(city: city)
                            }
                    }
                }
                
            }
            
            
            
            Spacer()
        }
    }
    
    func selectedCity(city: City) {
        if selectDepar {
            departureCity = city
        } else {
            destinationCity = city
        }
        
        presentationMode.wrappedValue.dismiss()
    }
    
}

//let cities = [City(name: "Amsterdam", cityID: "a123"), City(name: "Leiden", cityID: "l123")]
//
//struct LocationSelectView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        LocationSelectView(presentationMode: cities, departureCity: cities[0], destinationCity: $cities[1])
//    }
//}
