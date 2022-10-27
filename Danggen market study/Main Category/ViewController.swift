//
//  ViewController.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    
    @IBOutlet weak var table: UITableView!
    
    struct Sunset {
        let title: String
        let imageName: String
        
    }
    
    let data: [Sunset] = [
    Sunset(title: "Morining Run", imageName: "sunset1"),
    Sunset(title: "Evening Sunset", imageName: "sunset2"),
    Sunset(title: "Vacation Photos", imageName: "sunset3"),
    Sunset(title: "Visiting Frieends", imageName: "sunset4"),
    Sunset(title: "Som Other Title", imageName: "sunset5")
    
    ]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
   
        
    

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let sunset = data[indexPath.row]
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
    cell.label.text = sunset.title
    cell.iconImageView.image = UIImage(named: sunset.imageName)
    return cell
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
 
    }
    
    
   
    
}


