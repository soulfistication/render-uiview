//
//  CoDiProtoView.swift
//  ShareQR
//
//  Created by Ivan Almada on 3/30/20.
//  Copyright © 2020 Ivan Almada. All rights reserved.
//

import UIKit

class CoDiProtoView: UIView {

  @IBOutlet private weak var qrImageView: UIImageView!
  @IBOutlet private weak var beneficiaryLabel: UILabel!
  @IBOutlet private weak var amountLabel: UILabel!
  @IBOutlet private weak var conceptLabel: UILabel!

  // MARK: - Initializer

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - Configure

  func configure(model: CodiShareVoucherModel) {
    beneficiaryLabel.text = model.beneficiary
    amountLabel.text = model.amount
    conceptLabel.text = model.concept
    qrImageView.image = model.qrImage
  }

}
