//
//  UIView+Resize.swift
//  ShareQR
//
//  Created by Ivan Almada on 3/30/20.
//  Copyright © 2020 Ivan Almada. All rights reserved.
//

import UIKit

extension UIView {

  static func resizeToHalf(image: UIImage) -> UIImage? {
    guard image.scale != 0 else {
      return nil
    }

    let scale = 1 / image.scale
    let aspectRatio = 1.0
    let sharedContext = CIContext(options: [.useSoftwareRenderer: false])

    guard let cgImage = image.cgImage else {
      return nil
    }

    let coreImage = CIImage(cgImage: cgImage)

    let filter = CIFilter(name: "CILanczosScaleTransform")
    filter?.setValue(coreImage, forKey: kCIInputImageKey)
    filter?.setValue(scale, forKey: kCIInputScaleKey)
    filter?.setValue(aspectRatio, forKey: kCIInputAspectRatioKey)

    guard let outputCIImage = filter?.outputImage,
      let outputCGImage = sharedContext.createCGImage(outputCIImage,
                                                      from: outputCIImage.extent)
      else {
        return nil
    }

    return UIImage(cgImage: outputCGImage)
  }

}
