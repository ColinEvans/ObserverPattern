//
//  FontColorPublisher.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import SwiftUI

struct FontColorPublisherView: View {
  @ObservedObject var viewModel: FontColorPublisherViewModel
  @State private var showingPopover = false

  var body: some View {
    GeometryReader { proxy in
      VStack {
        Rectangle()
          .fill(viewModel.fontColor)
          .frame(width: 100, height: 100)
          .cornerRadius(12.0)
          .onTapGesture {
           showingPopover = true
          }
        ColorPicker("Font Color", selection: $viewModel.fontColor, supportsOpacity: false)
          .padding(.horizontal, (proxy.size.width * 0.2))
      }.frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  FontColorPublisherView(viewModel: FontColorPublisherViewModel())
}
