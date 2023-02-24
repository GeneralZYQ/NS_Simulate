//
//  PlanView.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 29/01/2023.
//

import SwiftUI



struct PlanView: View {
    
//    init() {
//            let navAppearance = UINavigationBarAppearance()
//            navAppearance.backgroundColor = .white;
////            navAppearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
////            navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
//            navAppearance.shadowImage = nil;
//            navAppearance.shadowColor = .clear
//            UINavigationBar.appearance().standardAppearance = navAppearance
//            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
//        }
//
    
    @State private var verticalOffset: CGFloat = 0.0
    @State private var disCount : Int = 1
    
    let fakecities = [City(name: "Haarlem", cityID: "1"), City(name: "Amsterdam RAI", cityID: "2"), City(name: "Leiden", cityID: "3")]
    let fakePaths = [CityPair(startCity: City(name: "Haarlem Den Haaag", cityID: "1"), desCity: City(name: "Leiden Central", cityID: "3"))]
    
    func topBarOpacity(offset: CGFloat) -> Double {
        return offset <= -20 ? 1.0 : 0.0;
//        return 0.3;
    }
    
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                VStack(spacing:0) {
                    
                        OffsettableScrollView { point in
                                        verticalOffset = point.y
                        } content: {
                            
                            //This is for the header elements
                            Group {
                                PlannerHeader(outSideOffset: $verticalOffset)
                                    .frame(height:min(120, 120 + verticalOffset))
                                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                                
                                Spacer().frame(height: 20)
                                    
                                
                                PlanDepartDestiView()
                                Spacer().frame(height: 10)
                                
                                DepartureOptionView()
                                
                                Spacer().frame(height: 10)
                                
                                HStack {
                                    
                                    Button {
                                        
                                    } label: {
                                        Text("Plan your journey")
                                            .bold()
                                            .frame(maxWidth: .infinity, minHeight: 40)
                                            .foregroundColor(Color.white)
                                            .background(Color.blue)
                                            .cornerRadius(5)
                                            .padding(.leading, 10)
                                            .padding(.trailing, 10)
                                    }
                                    
                                }
                                
                                Spacer().frame(height: 20)
                                
                                Divider()
                                
                                DisruptionPromptView(disruptionCount: disCount)
    //                                .background(Color.yellow)
                            }
                            
                            
                            //This is for the personal preference
                            Group {
                                
                                Spacer().frame(height: 30)
//                                Color.gray.frame(height: 30)
                                
                                LazyVStack(spacing: 0) {
                                    FavoriteWidget(favorites: fakecities)
                                        
                                    FavoriteTripsWidget(paths: fakePaths)
                                }
                                
                                
                            }
                            
                           
                        }.background(Color.yellow)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                }.ignoresSafeArea(edges: .top)
                
                VStack {

                    ZStack {
                        Color.yellow
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        
                        VStack {
                            Spacer()
                            Image(systemName: "arrow.left.and.line.vertical.and.arrow.right")
                                .foregroundColor(Color.blue)
                                .scaleEffect(0.70)
                                .padding(.top, 10)
//                            Spacer()
                            Text("Let us say offset \(verticalOffset)").opacity(0.0)
                        }
                        
                        
                        
                        
                    }.frame(height:60)
                        .opacity(self.topBarOpacity(offset: verticalOffset))
                    Spacer()
                    
                }.ignoresSafeArea()
                    
            }.background(Color.yellow)
            
        }
        
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
