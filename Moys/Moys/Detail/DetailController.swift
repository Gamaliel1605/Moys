//
//  DetailController.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 03/05/21.
//

import UIKit

var currPersiapan = 0

class DetailController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tablePersiapan: UITableView!
    @IBOutlet weak var buttonStep: UIButton!
    
    var prepToy: [PrepareToy] = []
    var prepDanbo: [PrepareToy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablePersiapan.delegate = self
        tablePersiapan.dataSource = self
        prepToy = [
            PrepareToy(title_prep: "Stik es krim", image_prep: UIImage(named: "stik-es")),
            PrepareToy(title_prep: "Gunting", image_prep: UIImage(named: "gunting")),
            PrepareToy(title_prep: "Lem", image_prep: UIImage(named: "lem"))
        ]
        prepDanbo = [
            PrepareToy(title_prep: "Kardus", image_prep: UIImage(named: "kardus")),
            PrepareToy(title_prep: "Gunting", image_prep: UIImage(named: "gunting")),
            PrepareToy(title_prep: "Lem", image_prep: UIImage(named: "lem"))
        ]
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        setupView()
        buttonStep.layer.cornerRadius = 10.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    func setupView(){
        tablePersiapan.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "persiapanIdentifier")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if temp == 0 {
            return prepToy.count
            
        } else if temp == 1 {
            return prepDanbo.count
        }
        buttonStep.isHidden = true
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablePersiapan.dequeueReusableCell(withIdentifier: "persiapanIdentifier", for: indexPath) as! DetailCell
        
        if temp == 0{
            cell.titlePersiapan.text = prepToy[indexPath.row].title_prep
            cell.imagePersiapan.image = prepToy[indexPath.row].image_prep
        } else {
            cell.titlePersiapan.text = prepDanbo[indexPath.row].title_prep
            cell.imagePersiapan.image = prepDanbo[indexPath.row].image_prep
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    @IBAction func toStep(_ sender: Any) {
        let toStepVC = UIStoryboard(name: "Step", bundle: nil)
        let vc = toStepVC.instantiateViewController(identifier: "stepID") as! StepController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
