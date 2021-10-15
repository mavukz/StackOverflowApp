//
//  StackOverFlowEmptyTableViewCell.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/08.
//

import UIKit

class StackOverFlowEmptyTableViewCell: UITableViewCell {

    @IBOutlet private var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Mutators
    func configure(with descriptionText: String?) {
        descriptionLabel.text = descriptionText
    }
    
    // MARK: - Private
    private func configureUI() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        descriptionLabel.textColor = UIColor.primaryGrayColor
    }
}
