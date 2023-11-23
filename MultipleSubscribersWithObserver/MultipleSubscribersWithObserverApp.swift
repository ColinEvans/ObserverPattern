//
//  MultipleSubscribersWithObserverApp.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import SwiftUI

@main
struct MultipleSubscribersWithObserverApp: App {
  let fontColorPublisherViewModel = FontColorPublisherViewModel()
  let fontSizePublisherViewModel = FontSizePublisherViewModel()

  var body: some Scene {
    WindowGroup {
      ContentView(
        fontSizeViewModel: fontSizePublisherViewModel,
        fontColorViewModel: fontColorPublisherViewModel,
        subscriberData: SubscriberListProvider.getSubscribers()
      )
    }
  }
}
