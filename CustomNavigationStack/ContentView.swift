//
//  ContentView.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

enum Route: Hashable {
  case first
  case second
}

struct ContentView: View {
  @State private var navigationPath = NavigationPath()
  
  var body: some View {
    CustomNavigationStack(path: $navigationPath) {
      ZStack {
        Color.green.ignoresSafeArea()
        
        VStack(spacing: 32) {
          CustomNavigationLink {
            Text("NavigationLink Destination")
              .customNavigationTitle("Destination")
              .customNavigationSubtitle("NavigationLink Destination")
          } label: {
            Text("Route through NavigationLink")
          }
          
          Button("Route through NavigationPath #1") {
            navigationPath.append(Route.first)
          }
          
          Button("Route through NavigationPath #2") {
            navigationPath.append(Route.second)
          }
        }
      }
      .showBackButton(false)
      .customNavigationTitle("Main Screen")
      .navigationDestination(for: String.self) { destination in
        Text(destination)
      }
      .navigationDestination(for: Route.self) { destination in
        switch destination {
        case .first:
          CustomNavigationBarContainer {
            Text("NavigationPath Destination #1")
              .customNavigationTitle("Destination")
              .customNavigationSubtitle("NavigationPath Destination #1")
          }
        case .second:
          CustomNavigationBarContainer {
            Text("NavigationPath Destination #2")
              .customNavigationTitle("Destination")
              .customNavigationSubtitle("NavigationPath Destination #2")
          }
        }
      }
    }
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
