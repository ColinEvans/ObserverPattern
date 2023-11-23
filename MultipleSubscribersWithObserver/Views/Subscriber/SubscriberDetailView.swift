//
//  SubscriberDetailView.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-23.
//

import SwiftUI

struct SubscriberDetailView: View {
  @ObservedObject var viewModel: SubscriberViewModel
  @EnvironmentObject var sizePublisher: FontSizePublisherViewModel
  @EnvironmentObject var colorPublisher: FontColorPublisherViewModel
  @State private var isSizeSubscribed: Bool = false
  @State private var isColorSubscribed: Bool = false
  
  var body: some View {
    VStack {
      Text(viewModel.stringValue)
        .font(.system(size: viewModel.size))
        .foregroundStyle(viewModel.color)
      
      isSubbedToPublisher(
        isSubbed: isSizeSubscribed,
        publisherName: "Font Size"
      ).onTapGesture {
        if isSizeSubscribed {
          sizePublisher.unsubscribe(viewModel)
        } else {
          sizePublisher.subscribe(viewModel)
        }
        isSizeSubscribed.toggle()
      }
      
      isSubbedToPublisher(
        isSubbed: isColorSubscribed,
        publisherName: "Font Color"
      ).onTapGesture {
        if isColorSubscribed {
          colorPublisher.unsubscribe(viewModel)
        } else {
          colorPublisher.subscribe(viewModel)
        }
        isColorSubscribed.toggle()
      }
    }.onAppear {
      isSizeSubscribed = isSubscribed(to: sizePublisher)
      isColorSubscribed = isSubscribed(to: colorPublisher)
    }
  }
  
  private func isSubscribed(to publisher: some Publisher) -> Bool {
    publisher.isSubscribed(viewModel)
  }
}

private struct isSubbedToPublisher: View {
  let isSubbed: Bool
  let publisherName: String
  
  var body: some View {
    HStack {
      Text("Subscribed to \(publisherName)")
      Image(
        systemName: isSubbed ? "checkmark.circle.fill" : "x.circle.fill"
      )
    }
  }
}
