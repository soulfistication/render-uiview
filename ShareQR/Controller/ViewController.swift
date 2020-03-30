//
//  ViewController.swift
//  ShareQR
//
//  Created by Ivan Almada on 3/30/20.
//  Copyright © 2020 Ivan Almada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()

    if let data = ScreenshotTaker().takeScreenShot() {
      print(data.count)
    }

  }

}
