//
//  test.swift
//  NS_Simulate
//
//  Created by yuanqing zhang on 07/03/2023.
//

import SwiftUI

struct test: View {
    var body: some View {
        List {
          Text("Non-sticky part of the header...")
            .font(.system(size: 32))
            
            Text("hahahah")

          Section(header: HStack {
            Text("Sticky header")
              .font(.system(size: 24))
            Spacer()
            Image(systemName: "sun.max.fill")
          }) {
            ForEach(1..<40) { index in
              Text("Row #\(index)")
            }
          }
            
        

          Section(header: HStack {
            Text("Sticky header 2")
              .font(.system(size: 24))
            Spacer()
            Image(systemName: "sun.max.fill")
          }) {
            ForEach(1..<40) { index in
              Text("Row #\(index)")
            }
          }
        }
        .environment(\.defaultMinListHeaderHeight, 0)
        .listStyle(.plain) // PlainListStyle() on SwiftUI 1 and 2
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
