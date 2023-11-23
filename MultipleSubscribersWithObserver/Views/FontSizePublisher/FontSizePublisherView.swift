//
//  FontIncreasePublisherView.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import SwiftUI

struct FontSizePublisherView: View {
  @ObservedObject var viewModel: FontSizePublisherViewModel

  var body: some View {
    HStack {
      Image(systemName: "minus.circle").onTapGesture {
        viewModel.decreaseFontSize()
      }
      Text("Font Size")
        .font(.system(size: viewModel.fontSize))
      Image(systemName: "plus.circle").onTapGesture {
        viewModel.increaseFontSize()
      }
    }
  }
}

#Preview {
  FontSizePublisherView(
    viewModel: FontSizePublisherViewModel()
  )
}
