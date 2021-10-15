//
//  StackOverflowLoadingView.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/11.
//

import UIKit

class StackOverflowLoadingView: UIView, NibLoadable {
   
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
}
