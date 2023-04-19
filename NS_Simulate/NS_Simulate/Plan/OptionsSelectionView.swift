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
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 55)
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


struct OptionsSelectionView: View {
    
    @EnvironmentObject var options : Options
    
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
            TransTypesView()
            Divider().padding(.top, 10)
            Group {
                Text("Public transport")
                    .font(.body)
                    .bold(true)
                    .foregroundColor(.blue)
                    .padding(.leading, 5)
                    .padding(.top, 20)
            }
            
            
            Spacer()
        }
        
    }
}

struct OptionsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsSelectionView()
    }
}
