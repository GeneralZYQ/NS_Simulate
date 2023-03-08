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
                    
                }.frame(height: 65)
                
                
                List() {
                    
                    CurrentLocationView()
                        .background(.red)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())

                    Color.yellow
                        .listRowInsets(EdgeInsets())
                    
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
                          
                          NearbyStationsView()
                          
                      }
                      .listRowInsets(EdgeInsets())
                    
                }
                .listStyle(PlainListStyle())
                
                
                
                
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
