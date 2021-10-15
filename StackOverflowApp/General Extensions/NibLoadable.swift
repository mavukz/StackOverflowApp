//
//  NibLoadable.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/11.
//

import Foundation
import UIKit

protocol NibLoadable: AnyObject {
    static func nib() -> UINib
    static func loadFromNib(owner: Any?) -> Self?
    static func bundle() -> Bundle
}

extension NibLoadable {
    
    static func nib() -> UINib {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        return nib
    }
    
    static func bundle() -> Bundle {
        return Bundle(for: self)
    }
}

extension NibLoadable where Self: UIView {
    
    static func viewFromNib(owner: Any? = nil) -> Self? {
        return loadFromNib(owner: owner)
    }
    
    static func loadFromNib(owner: Any? = nil) -> Self? {
        let bundle = Bundle(for: self)
        let views = bundle.loadNibNamed(String(describing: self),
                                        owner: owner,
                                        options: nil)
        guard let view = views?.first as? Self else { return nil }
        return view
    }
}

extension NibLoadable where Self: UIViewController {
    
    static func viewControllerFromNib() -> Self? {
        return loadFromNib()
    }
    
    static func loadFromNib(owner: Any? = nil) -> Self? {
        let viewController = self.init(nibName: String(describing: self),
                                       bundle: Bundle(for: self))
        return viewController
    }
}
