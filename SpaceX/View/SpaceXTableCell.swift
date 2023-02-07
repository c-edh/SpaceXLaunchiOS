//
//  SpaceXTableCell.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import UIKit

class SpaceXTableCell: UITableViewCell {

    @IBOutlet weak var successLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var launch: SpaceXModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setUpCell() {
        guard let launch = launch else {
            return
        }
        titleLabel.text = launch.name ?? Constants.SpaceXCell.notAvailable
     
        dateLabel.text = "Launch time: " + (launch.date?.dateFormatter(style: .full) ?? Constants.SpaceXCell.notAvailable)
        
        dateLabel.adjustsFontSizeToFitWidth = true

        descriptionLabel.text = launch.details ?? Constants.SpaceXCell.notAvailable
        descriptionLabel.numberOfLines = 0
        
        if let success = launch.success {
            if success {
                successLabel.text = Constants.SpaceXCell.success
                successLabel.textColor = .green
            } else {
                successLabel.text = Constants.SpaceXCell.fail
                successLabel.textColor = .red
            }
        } else {
            successLabel.textColor = .label
            successLabel.text = Constants.SpaceXCell.notAvailable
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
