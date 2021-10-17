//
//  StackOverflowDetailViewController.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation
import UIKit

class StackOverflowDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private var headerLabel: UILabel!
    @IBOutlet private var firstSeparatorView: UIView!
    @IBOutlet private var detailLabel: UILabel!
    @IBOutlet private var secondSeparatorView: UIView!
    @IBOutlet private var tagsLabel: UILabel!
    @IBOutlet private var thirdSeparatorView: UIView!
    @IBOutlet private var profileView: StackOverflowProfileView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    private func configureUI() {
        headerLabel.font = UIFont.systemSemibold17
        headerLabel.textColor = UIColor.darkerGrayColor
        headerLabel.backgroundColor = UIColor.backgroundGrayColor
        firstSeparatorView.backgroundColor = UIColor.darkerGrayColor
        detailLabel.font = UIFont.systemRegular13
        secondSeparatorView.backgroundColor = UIColor.darkerGrayColor
        tagsLabel.font = UIFont.systemBold10
        tagsLabel.backgroundColor = UIColor.darkerGrayColor
        thirdSeparatorView.backgroundColor = UIColor.darkerGrayColor
//        profileView.configure(with: <#T##UIImage?#>, name: <#T##String?#>, rating: <#T##String?#>, questionDate: <#T##String?#>)
    }
}
