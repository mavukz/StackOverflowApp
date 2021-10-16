//
//  StackOverflowDetailTableViewCell.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/06.
//

import UIKit

class StackOverflowDetailTableViewCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var votesLabel: UILabel!
    @IBOutlet private var answersLabel: UILabel!
    @IBOutlet private var viewsLabel: UILabel!
    @IBOutlet private var askedByLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Mutators
    func configure(with viewModel: StackOverflowCellViewModel) {
        titleLabel.text = viewModel.questionTitle
        votesLabel.text = viewModel.votesDescription
        answersLabel.text = viewModel.answersDescription
        votesLabel.text = viewModel.votesDescription
        askedByLabel.text = viewModel.askedByDescription
    }
    
    // MARK: - Private
    private func configureUI() {
        titleLabel.font = UIFont.systemRegular14
        titleLabel.textColor = UIColor.primaryBlueColor
        votesLabel.font = UIFont.systemRegular10
        votesLabel.textColor = UIColor.primaryGrayColor
        answersLabel.font = UIFont.systemRegular10
        answersLabel.textColor = UIColor.primaryGrayColor
        viewsLabel.font = UIFont.systemRegular10
        viewsLabel.textColor = UIColor.primaryGrayColor
        askedByLabel.font = UIFont.systemRegular10
        askedByLabel.textColor = UIColor.primaryGrayColor
    }
}
