//
//  ToyCell.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 03/05/21.
//

import UIKit

class ToyCell: UITableViewCell {

    @IBOutlet weak var toyImage: UIImageView!
    @IBOutlet weak var toyButton: UIButton!
    @IBOutlet weak var toyTitle: UILabel!
    @IBOutlet weak var toyDescription: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 10.0
        cellView.layer.borderColor = #colorLiteral(red: 0.1335214674, green: 0.5039990544, blue: 0.4363183975, alpha: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
