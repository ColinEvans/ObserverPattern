//
//  Publisher.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-21.
//

import Foundation


protocol Publisher {
  associatedtype T
  func subscribe(_ subscriber: some Subscriber)
  func unsubscribe(_ subscriber:  some Subscriber)
  func isSubscribed(_ sub: some Subscriber) -> Bool

  func notify(_ updateToPublish: T)
}
