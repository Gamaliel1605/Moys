//
//  StepController.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 04/05/21.
//

import UIKit

class StepController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var stepCell: UICollectionView!
    
    var stepPesawat: [StepToy] = []
    var stepDanbo: [StepToy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepCell.delegate = self
        stepCell.dataSource = self
        stepPesawat = [
            StepToy(totalStep : 6, step: "1", image: UIImage.animatedImage(with: [#imageLiteral(resourceName: "step1-1"), #imageLiteral(resourceName: "step1-2"), #imageLiteral(resourceName: "step1-3")], duration: 3)!, description: "Potong stik menjadi 3 bagian"),
            StepToy(totalStep : 6, step: "2", image: UIImage.animatedImage(with: [#imageLiteral(resourceName: "step2-2"), #imageLiteral(resourceName: "step2-3")], duration: 3)!, description: "Tempel dua bagian yang telahh di potong"),
            StepToy(totalStep : 6, step: "3", image: UIImage.animatedImage(with: [#imageLiteral(resourceName: "step3-1"), #imageLiteral(resourceName: "step3-2")], duration: 3)!, description: "Tempel dua stik pada dua stik yang telah di potong bagian belakang juga"),
            StepToy(totalStep : 6, step: "4", image: UIImage.animatedImage(with: [#imageLiteral(resourceName: "step4-1"), #imageLiteral(resourceName: "step4-2")], duration: 3)!, description: "Bentuk potongan stik terakhir dengan setiap ujung stik bulat"),
            StepToy(totalStep : 6, step: "5", image: UIImage.animatedImage(with: [#imageLiteral(resourceName: "step5-1"), #imageLiteral(resourceName: "step5-2")], duration: 3)!, description: "Tempel stik yang telah di bentuk bulat setiap ujungnya di bagian belakang"),
            StepToy(totalStep : 6, step: "6", image: UIImage.animatedImage(with: [#imageLiteral(resourceName: "step6-1"), #imageLiteral(resourceName: "step6-2")], duration: 3)!, description: "Tempel dua stik sejajar di bagian depan")
        ]
        setupView()
        stepCell.reloadData()
    }
    
    func setupView(){
        stepCell.register(UINib(nibName: "StepCell", bundle: nil), forCellWithReuseIdentifier: "stepIdentifier")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if temp == 0{
            return stepPesawat.count
        } else {
            return stepDanbo.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = stepCell.dequeueReusableCell(withReuseIdentifier: "stepIdentifier", for: indexPath) as! StepCell
        
        if temp == 0{
            cell.setupCell(toy: stepPesawat[indexPath.row])
        } else {
            cell.setupCell(toy: stepDanbo[indexPath.row])
        }
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 17, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = stepCell.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.stepCell.frame.size.width
        var currentPage = Int(stepCell.contentOffset.x / pageWidth)
        if currentPage ==  5{
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.navigationItem.rightBarButtonItem?.tintColor = .clear
        }
    }
    
    @IBAction func selesaiButton(_ sender: Any) {
        let toStepVC = UIStoryboard(name: "Congrat", bundle: nil)
        let vc = toStepVC.instantiateViewController(identifier: "congratID") as! CongratController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
