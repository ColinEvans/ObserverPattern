//
//  ContentView.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var fontSizeViewModel: FontSizePublisherViewModel
  @ObservedObject var fontColorViewModel: FontColorPublisherViewModel
  let subscriberData: [SubscriberViewModel]

  var body: some View {
    VStack {
      publishersView
      SubscriberListView(subscriberData: subscriberData)
        .environmentObject(fontSizeViewModel)
        .environmentObject(fontColorViewModel)
    }
  }
  
  private var publishersView: some View {
    Group {
      FontSizePublisherView(viewModel: fontSizeViewModel)
      FontColorPublisherView(viewModel: fontColorViewModel)
    }.frame(maxHeight: .infinity)
  }
  
  init?(
    fontSizeViewModel: FontSizePublisherViewModel,
    fontColorViewModel: FontColorPublisherViewModel,
    subscriberData: [some Subscriber]
  ) {
    guard let subscriberVms = subscriberData as? [SubscriberViewModel] else {
      return nil
    }
    self.fontSizeViewModel = fontSizeViewModel
    self.fontColorViewModel = fontColorViewModel
    self.subscriberData = subscriberVms
  }
}

#Preview {
    ContentView(
      fontSizeViewModel: FontSizePublisherViewModel(),
      fontColorViewModel: FontColorPublisherViewModel(),
      subscriberData: SubscriberViewModel.listPreview()
    )
}
