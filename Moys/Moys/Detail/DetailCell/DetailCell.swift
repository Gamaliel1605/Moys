//
//  DetailCell.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 04/05/21.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titlePersiapan: UILabel!
    @IBOutlet weak var imagePersiapan: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 10.0
        cellView.layer.borderColor = #colorLiteral(red: 0.1335214674, green: 0.5039990544, blue: 0.4363183975, alpha: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
