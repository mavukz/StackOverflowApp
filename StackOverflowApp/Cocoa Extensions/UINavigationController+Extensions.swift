//
//  UINavigationController+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/16.
//

import Foundation
import UIKit

extension Int {
    static let statusBarTag = 1000
}

extension UINavigationController {
    
    func setStatusBar(backgroundColor: UIColor?) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.tag = Int.statusBarTag
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
    
    func statusBar() -> UIView? {
        return view.subviews.first { $0.tag == Int.statusBarTag }
    }
}
