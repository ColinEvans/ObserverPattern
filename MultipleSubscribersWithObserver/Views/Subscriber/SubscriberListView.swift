//
//  SubscriberListView.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-23.
//

import SwiftUI

struct SubscriberListView: View {
  var subscriberData: [SubscriberViewModel]

  var body: some View {
    NavigationView {
      List(subscriberData, id: \.id) { subViewModel in
        NavigationLink {
          SubscriberDetailView(viewModel: subViewModel)
        } label: {
          Text(subViewModel.stringValue)
        }
      }
    }
  }
}

#Preview {
    SubscriberListView(
      subscriberData: SubscriberViewModel.listPreview()
    )
}
