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
    
    func setUpCell(){
        guard let launch = launch else{
            return
        }
        titleLabel.text = launch.name ?? K.cell.na
     
       
        
        dateLabel.text = "Launch time: " + (launch.date_utc ?? K.cell.na)
        
        dateLabel.adjustsFontSizeToFitWidth = true


        descriptionLabel.text = launch.details ?? K.cell.na
        descriptionLabel.numberOfLines = 0
        
        if let success = launch.success{
            if success{
                successLabel.text = K.cell.success
                successLabel.textColor = .green
            }else{
                successLabel.text = K.cell.fail
                successLabel.textColor = .red
            }
        }else{
            successLabel.textColor = .label
            successLabel.text = K.cell.na
        }
        
        
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
