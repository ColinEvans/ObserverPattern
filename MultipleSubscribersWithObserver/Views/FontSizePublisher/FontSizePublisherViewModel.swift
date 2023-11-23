//
//  FontIncreasePublisherViewModel.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import Foundation
import Combine

class FontSizePublisherViewModel: ObservableObject {
  @Published var fontSize: CGFloat = 20
  private var cancellables = Set<AnyCancellable>()
  private var subscribers = [any Subscriber]()

  func increaseFontSize() {
    fontSize += 1
  }
  
  func decreaseFontSize() {
    guard fontSize > 0 else { return }
    fontSize -= 1
  }

  init() {
    $fontSize.sink { [weak self] fontSize in
      self?.notify(FontDecoration(size: fontSize))
    }.store(in: &cancellables)
  }
}

extension FontSizePublisherViewModel: Publisher {
  func subscribe(_ subscriber: some Subscriber) {
    subscribers.append(subscriber)
  }
  
  func unsubscribe(_ subscriber: some Subscriber) {
    subscribers.removeAll(where: { $0.id == subscriber.id })
  }
  
  func isSubscribed(_ sub: some Subscriber) -> Bool {
    subscribers.contains(where: { $0.id == sub.id} )
  }
  
  func notify(_ updateToPublish: FontDecoration) {
    subscribers.forEach { $0.update(updateToPublish) }
  }
}
