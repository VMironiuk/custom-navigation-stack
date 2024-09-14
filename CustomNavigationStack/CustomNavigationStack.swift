//
//  CustomNavigationStack.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

struct CustomNavigationStack<Content: View>: View {
  let content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    NavigationStack {
      CustomNavigationBarContainer {
        content
      }
    }
  }
}

#Preview {
  CustomNavigationStack {
    Color.orange.ignoresSafeArea()
  }
}
