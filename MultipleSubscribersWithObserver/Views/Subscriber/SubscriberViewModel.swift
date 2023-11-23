//
//  SubscriberModel.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-22.
//

import Foundation
import SwiftUI

class SubscriberViewModel: ObservableObject, Subscriber {
  var id = UUID()
  let stringValue: String
  @Published var color: Color = .black
  @Published var size: CGFloat = 20

  init(name stringValue: String) {
    self.stringValue = stringValue
  }

  func update(_ fontDecoration: FontDecoration) {
    switch fontDecoration {
    case .color(let color):
      self.color = color
    case .fontSize(let size):
      self.size = size
    }
  }
}

extension SubscriberViewModel {
  static func forPreview() -> SubscriberViewModel {
    SubscriberViewModel(name: "Preview")
  }
  
  static func listPreview() -> [SubscriberViewModel] {
    [
      SubscriberViewModel(name: "test1"),
      SubscriberViewModel(name: "test2"),
      SubscriberViewModel(name: "test3"),
      SubscriberViewModel(name: "test4")
    ]
  }
}
