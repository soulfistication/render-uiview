//
//  ScreenshotTaker.swift
//  ShareQR
//
//  Created by Ivan Almada on 3/30/20.
//  Copyright © 2020 Ivan Almada. All rights reserved.
//

import UIKit

struct ScreenshotTaker {

  func takeScreenShot() -> Data? {
    guard let codiOfflineView: CoDiProtoView = Bundle.main.loadNibNamed("CoDiProtoView", owner: self, options: nil)?.first as? CoDiProtoView else {
      return nil
    }

    let name = "Ivan David Almada Perez"
    let amount = "123.5"
    let concept = "Quesadillas"

    let model = CodiShareVoucherModel(beneficiary: name,
                                      amount: amount,
                                      concept: concept,
                                      qrImage: nil)

    codiOfflineView.configure(model: model)

    codiOfflineView.setNeedsLayout()
    
    let format = UIGraphicsImageRendererFormat.default()
    format.scale = 1.0 // Not retina 2x
    
    let renderer = UIGraphicsImageRenderer(size: codiOfflineView.bounds.size, format: format)
    
    let snapshot = renderer.image { context in
      codiOfflineView.layer.render(in: context.cgContext)
    }

    return snapshot.jpegData(compressionQuality: 1.0)
  }

}
