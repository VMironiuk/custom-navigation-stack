//
//  CustomNavigationLink.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

struct CustomNavigationLink<Destination: View, Label: View>: View {
  let destination: Destination
  let label: Label
  
  init(
    @ViewBuilder destination: () -> Destination,
    @ViewBuilder label: () -> Label
  ) {
    self.destination = destination()
    self.label = label()
  }
  
  var body: some View {
    NavigationLink {
      CustomNavigationBarContainer {
        destination
      }
      .toolbar(.hidden)
    } label: {
      label
    }
  }
}

#Preview {
  CustomNavigationStack {
    CustomNavigationLink {
      Text("Destination")
    } label: {
      Text("Navigate")
    }
  }
}
