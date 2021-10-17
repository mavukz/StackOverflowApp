//
//  StackOverflowProfileView.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation
import UIKit

@IBDesignable
class StackOverflowProfileView: BaseComponentView {
    
    // MARK: - Outlets
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var questionDateLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Mutators
    // Should consider using component models instead of actual values
    func configure(with profileImage: UIImage?,
                   name: String?,
                   rating: String?,
                   questionDate: String?) {
        profileImageView.image = profileImage
        nameLabel.text = name
        ratingLabel.text = rating
        questionDateLabel.text = questionDate
    }
    
    // MARK: - Private
    private func configureUI() {
        nameLabel.font = UIFont.systemRegular13
        nameLabel.textColor = UIColor.primaryGrayColor
        ratingLabel.font = UIFont.systemBold10
        ratingLabel.textColor = UIColor.darkerGrayColor
        questionDateLabel.font = UIFont.systemRegular13
        questionDateLabel.textColor = UIColor.primaryGrayColor
    }
}
