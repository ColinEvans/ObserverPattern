//
//  FontDecoration.swift
//  MultipleSubscribersWithObserver
//
//  Created by Colin Evans on 2023-11-23.
//

import Foundation
import SwiftUI

enum FontDecoration {
  case color(Color)
  case fontSize(CGFloat)
}

extension FontDecoration {
  init(color: Color) {
    self = .color(color)
  }
  
  init(size: CGFloat) {
    self = .fontSize(size)
  }
}
