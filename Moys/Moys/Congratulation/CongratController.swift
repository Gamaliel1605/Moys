//
//  CongratController.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 05/05/21.
//

import UIKit

class CongratController: UIViewController {

    @IBOutlet weak var congratsView: UIView!
    @IBOutlet weak var congratsImage: UIImageView!
    @IBOutlet weak var congratsDesc: UILabel!
    @IBOutlet weak var buttonToHome: UIButton!
    
    var congratData: [Congrats] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congratData = [
            Congrats(image: UIImage(named: "pesawat")!, description: "Keren!!! Kamu sudah berhasil membuat mainan sendiri selamat bermain dengan mainan baru mu")
        ]
        setupView()
        congratsView.layer.cornerRadius = 10.0
        buttonToHome.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }

    func setupView(){
        if temp == 0 {
            congratsImage.image = UIImage(named: "pesawat")
            congratsDesc.text = "Keren!!! Kamu sudah berhasil membuat mainan sendiri selamat bermain dengan mainan baru mu"
        }
    }
    
    @IBAction func buttonBackHome(_ sender: Any) {
        let toHomeVC = UIStoryboard(name: "Home", bundle: nil)
        let VC = toHomeVC.instantiateViewController(identifier: "homeID") as! ViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}
