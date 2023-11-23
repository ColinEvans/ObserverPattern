//
//  Subscriber.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-23.
//

import Foundation

protocol Subscriber {
  var id: UUID { get set }
  func update(_ publishedUpdate: FontDecoration)
}
