//
//  DepartureTimeSelectionActionView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 16/04/2023.
//

import SwiftUI

struct departureOptionTopBar : View {
    
    @State private var buttonColor = Color.white
    @Binding var arrived : Bool
    @Binding var currentDate: Date
    
    @Binding var real_arrived: Bool
    @Binding var real_date : Date
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
    
        HStack {
            
            ZStack {
                Color.gray.frame(width: 180, height: 25)
                    .cornerRadius(5)
                
                HStack {
                    
                    if (arrived) {
                        Spacer()
                    }
                    
                    Color.blue.frame(width: 90, height: 25)
                        .cornerRadius(5)
                        .padding(0)
                    
                    if (!arrived) {
                        Spacer()
                    }
                    
                }.frame(width: 180, height: 25)
                
               
                
                HStack(spacing: 0) {
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            arrived.toggle()
                        }
                    } label: {
                        Text("Departure")
                            .frame(width: 90, height: 25)
                            .foregroundColor(.white)
//                            .background(.blue)
                            .font(.system(size: 15))
                            .cornerRadius(5)
                    }

                    Button {
                        
                        withAnimation(.easeInOut(duration: 0.5)) {
                            arrived.toggle()
                        }

                    } label: {
                        Text("Arrival")
                            .frame(width: 90, height: 25)
                            .foregroundColor(arrived ? Color.white : Color.black)
                            .background(.clear)
                            .font(.system(size: 15))
                    }
                }
            }.padding(.leading, 10)
            
            
            
            Spacer()
            
            Button {
                real_date = Date()
                real_arrived = arrived
                dismiss()
            } label: {
                Text("Now")
                    .frame(width: 70, height: 35)
                    .foregroundColor(.blue)
                    .background(.white)
                    .font(.system(size: 18))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.blue, lineWidth: 1)
                    }
            }
            .padding(.trailing, 10)


        }
    }
}


struct DepartureTimeSelectionActionView: View {
    
    @State private var temp_date = Date()
    @State private var arrived = false
    
    @Binding var currentDate : Date
    @Binding var arriving : Bool
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 0) {
               Spacer()
                
            
            
                VStack {
                    
                    departureOptionTopBar(arrived: $arrived, currentDate: $temp_date, real_arrived: $arriving, real_date: $currentDate)
                    DatePicker("", selection: $temp_date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                    
                    Button {
                        currentDate = temp_date
                        arriving = arrived
                        dismiss()
                    } label: {
                        Text("Apply")
                            .foregroundColor(.white)
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                            .background(.blue)
                            .padding()
                        
                    }
                    
                }.padding(.top, 20)
                .background(.white)
                
            
            
            
            

        }
    }
}


//struct DepartureTimeSelectionActionView_Previews: PreviewProvider {
//
//
//
//    @State var selected_date :Date
//    static var previews: some View {
//
//        DepartureTimeSelectionActionView(currentDate: $selected_date)
//    }
//}
