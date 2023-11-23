//
//  FontColorPublisherViewModel.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import Foundation
import Combine
import SwiftUI

class FontColorPublisherViewModel: ObservableObject {
  @Published var fontColor: Color = .black
  private var cancellables = Set<AnyCancellable>()
  private var subscribers = [any Subscriber]()
  
  init() {
    $fontColor.sink { [weak self] color in
      self?.notify(color)
    }.store(in: &cancellables)
  }
}

extension FontColorPublisherViewModel: Publisher {
  func subscribe(_ subscriber: some Subscriber) {
    subscribers.append(subscriber)
  }

  func unsubscribe(_ subscriber: some Subscriber) {
    subscribers.removeAll(where: { $0.id == subscriber.id })
  }
  
  func isSubscribed(_ sub: some Subscriber) -> Bool {
    subscribers.contains(where: { $0.id == sub.id} )
  }
  
  func notify(_ updateToPublish: Color) {
    subscribers.forEach { $0.update(FontDecoration(color: updateToPublish)) }
  }
}
