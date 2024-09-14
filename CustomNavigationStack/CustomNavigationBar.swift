//
//  CustomNavigationBar.swift
//  CustomNavigationStack
//
//  Created by Volodymyr Myroniuk on 14.09.2024.
//

import SwiftUI

struct CustomNavigationBar: View {
  @Environment(\.dismiss) private var dismiss
  @State private var showBackButton: Bool = true
  @State private var title: String = "Title"
  @State private var subtitle: String? = "Subtitle"
  
  var body: some View {
    HStack {
      if showBackButton {
        backButton
      }
      Spacer()
      titleSection
      Spacer()
      if showBackButton {
        backButton
          .opacity(0)
      }
    }
    .padding()
    .tint(.white)
    .foregroundStyle(.white)
    .font(.headline)
    .background(Color.blue)
  }
}

private extension CustomNavigationBar {
  private var backButton: some View {
    Button {
      dismiss()
    } label: {
      Image(systemName: "chevron.left")
    }
  }
  
  private var titleSection: some View {
    VStack {
      Text(title)
        .font(.title)
        .fontWeight(.semibold)
      if let subtitle {
        Text(subtitle)
      }
    }
  }
}

#Preview {
  VStack {
    CustomNavigationBar()
    Spacer()
  }
}
