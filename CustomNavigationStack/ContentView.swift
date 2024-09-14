//
//  ContentView.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    defaultNavigationStack
  }
}

private extension ContentView {
  private var defaultNavigationStack: some View {
    NavigationStack {
      ZStack {
        Color.green.ignoresSafeArea()
        
        NavigationLink("Navigate", value: "Destination")
      }
      .navigationDestination(for: String.self) { destination in
        Text(destination)
          .navigationTitle("Destination")
      }
      .navigationTitle("Navigation Title")
    }
  }
}

#Preview {
  ContentView()
}
