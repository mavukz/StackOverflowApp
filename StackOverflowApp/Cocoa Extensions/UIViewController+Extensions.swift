//
//  UIViewController+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/16.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setStatusBar(backgroundColor: UIColor?) {
          let statusBarFrame: CGRect
          if #available(iOS 13.0, *) {
              statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
          } else {
              statusBarFrame = UIApplication.shared.statusBarFrame
          }
          let statusBarView = UIView(frame: statusBarFrame)
          statusBarView.backgroundColor = backgroundColor
          view.addSubview(statusBarView)
      }
}
