//
//  StepCell.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 05/05/21.
//

import UIKit

class StepCell: UICollectionViewCell {

    @IBOutlet weak var stepIndex: UILabel!
    @IBOutlet weak var stepImage: UIImageView!
    @IBOutlet weak var stepDescription: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 10.0
        

    }

    func setupCell(toy: StepToy) {
        stepIndex.text = "\(toy.step) dari \(toy.totalStep)"
        stepImage.image = toy.image
        stepDescription.text = toy.description
    }
    
}
