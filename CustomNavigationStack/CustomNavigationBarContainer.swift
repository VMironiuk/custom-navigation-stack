//
//  CustomNavigationBarContainer.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

struct CustomNavigationBarContainer<Content: View>: View {
  var content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    VStack(spacing: 0) {
      CustomNavigationBar()
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

#Preview {
  CustomNavigationBarContainer {
    ZStack {
      Color.green.ignoresSafeArea()
      Text("Content")
        .foregroundStyle(.white)
    }
  }
}
