//
//  DepartureOptionView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 31/01/2023.
//

import SwiftUI

struct DepartureTimeActionView: View {
    
    @State private var showingTimeView = false
    @State var selected_Date = Date()
    @State var arriving = false
    
    

    var body: some View {
        
        GeometryReader { proxy in
            
            Button {
                
                showingTimeView = true
                
            } label: {
                HStack(spacing: 2) {
                    
                    
                    
                    Text(stringify_direction(dire: arriving))
                        .font(.title3)
                        .bold()
                        .padding(.leading, 10)
                        .foregroundColor(Color.blue)
                   
                    Text(convert_date(sele_date:selected_Date))
                        .font(.subheadline)
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                
                .frame(width: proxy.size.width, height: proxy.size.height)
                .background(Color.white)
                .cornerRadius(5)
            }.buttonStyle(PlainButtonStyle())
            .fullScreenCover(isPresented: $showingTimeView) {
                    ZStack {
                        
                        Color.black.opacity(0.2).edgesIgnoringSafeArea(.all)
                        DepartureTimeSelectionActionView(currentDate: $selected_Date, arriving: $arriving)
                    }.background(BackgroundBlurView())
                }
        }

    }
    
    func convert_date(sele_date : Date)->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E. d-MM"
        return formatter.string(from: sele_date)
    }
    
    func stringify_direction(dire: Bool)->String {
        if dire {
            return "Arrival: "
        } else {
            return "Departure: "
        }
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIVibrancyEffect())
        DispatchQueue.main.async {
            
            view.superview?.superview?.backgroundColor = .clear
            
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct OptionButton: View {
    
    @EnvironmentObject var options : Options
    
    @State private var showingOptions = false
    
    var body: some View {
        GeometryReader { proxy in
            Button {
                showingOptions = true
            } label: {
                
                ZStack {
                    
                    Color.gray.opacity(0.2)
                    Color.yellow.opacity(0.2)
                    
                    HStack {
                        Spacer()
                        Text("Options")
                            .bold()
                            .foregroundColor(Color.blue)
                            .font(.title2)
                        Spacer()
                    }
                    
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
                
                
                
            }.buttonStyle(PlainButtonStyle())
            .cornerRadius(5)
            .sheet(isPresented: $showingOptions) {
                OptionsSelectionView(ini_public_types: options.publics)
            }
//                .background(Color.red)

        }
    }
}

struct DepartureOptionView: View {
    
    @EnvironmentObject var options: Options
    
    var body: some View {
        ZStack {
            Color.clear
            
            GeometryReader { proxy in
                
                HStack(spacing: 0) {
                    DepartureTimeActionView()
                        .frame(width: (proxy.size.width - 30) * 2.0 / 3.0, height: proxy.size.height)
                    
                    Color.yellow.frame(width: 10)
                    
                    OptionButton()
                }
            }
            
            
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .background(Color.clear)
            .frame(height: 45)
    }
}

struct DepartureOptionView_Previews: PreviewProvider {
    static var previews: some View {
        DepartureOptionView()
    }
}
