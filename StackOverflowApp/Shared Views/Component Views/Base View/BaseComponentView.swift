//
//  BaseComponentView.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation
import UIKit

class BaseComponentView: UIView, NibLoadable {
    
    override func awakeAfter(using coder: NSCoder) -> Any? {
        let placeholderViewLoaded = self.subviews.isEmpty
        if placeholderViewLoaded {
            let subview = Self.loadFromNib()
            return subview
        }
        return self
    }
}
