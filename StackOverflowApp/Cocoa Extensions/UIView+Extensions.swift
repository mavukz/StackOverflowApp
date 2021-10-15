//
//  UIView+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/11.
//

import Foundation
import UIKit

extension UIView {
    
    func showLoadingView() {
        guard let loadingView = StackOverflowLoadingView.loadFromNib() else { return }
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loadingView)
        loadingView.constrainViewEdgesTo(containerView: self)
    }
    
    func removeLoadingView() {
        guard let loadingView = self.subviews.first(where: { $0 is StackOverflowLoadingView }) else { return }
        loadingView.removeFromSuperview()
    }
}

// MARK: -  Anchor Constaints
extension UIView {
    
    func constrainViewEdgesTo(containerView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
}
