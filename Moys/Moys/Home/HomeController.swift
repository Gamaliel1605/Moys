//
//  ViewController.swift
//  Moys
//
//  Created by Carlos Gamaliel Manurung on 03/05/21.
//

import UIKit

var temp = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableListToy: UITableView!
    
    var getData: [ListToy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableListToy.delegate = self
        tableListToy.dataSource = self
        getData = [
            ListToy(image: UIImage(named: "pesawat"), title: "Pesawat", description: "Membuat pesawat dari stik es krim"),
            ListToy(image: UIImage(named: "danbo"), title: "Danbo", description: "Membuat danbo dari kardus")
        ]

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupView(){
        tableListToy.register(UINib(nibName: "ToyCell", bundle: nil), forCellReuseIdentifier: "toyIdentifier")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableListToy.dequeueReusableCell(withIdentifier: "toyIdentifier", for: indexPath) as! ToyCell
        cell.toyTitle.text = getData[indexPath.row].title
        cell.toyDescription.text = getData[indexPath.row].description
        cell.toyImage.image = getData[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(300)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        temp = indexPath.row
        navigateToDetail(detailObject: getData[indexPath.row])
        
    }
    
    private func navigateToDetail(detailObject: ListToy){
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let navTD = (storyboard.instantiateViewController(identifier: "detailList") as? DetailController)!
        self.navigationController?.pushViewController(navTD, animated: true)
    }
    
}

