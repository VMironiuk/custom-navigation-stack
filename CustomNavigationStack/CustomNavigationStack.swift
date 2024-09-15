//
//  CustomNavigationStack.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

struct CustomNavigationStack<Content: View>: View {
  let path: Binding<NavigationPath>
  let content: Content
  
  init(path: Binding<NavigationPath>, @ViewBuilder content: () -> Content) {
    self.path = path
    self.content = content()
  }
  
  var body: some View {
    NavigationStack(path: path) {
      CustomNavigationBarContainer {
        content
      }
    }
  }
}

#Preview {
  CustomNavigationStack(path: .constant(NavigationPath())) {
    Color.orange.ignoresSafeArea()
  }
}
