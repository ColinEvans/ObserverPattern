//
//  SubscriberListProvider.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-23.
//

import Foundation

struct SubscriberListProvider {
  static func getSubscribers() -> [some Subscriber] {
    [
      SubscriberViewModel(name: "Subscriber 1"),
      SubscriberViewModel(name: "Subscriber 2"),
      SubscriberViewModel(name: "Subscriber 3"),
      SubscriberViewModel(name: "Subscriber 4")
    ]
  }
}
