//
//  UITableView+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/06.
//

import Foundation
import UIKit

extension UITableView {
    
    func configureForDynamicHeightRows() {
        self.estimatedRowHeight = 60
        self.estimatedRowHeight = UITableView.automaticDimension
    }
}
