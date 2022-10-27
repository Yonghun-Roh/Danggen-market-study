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
    Sunset(title: "해가 뜨는 나라로 초대합니다.", imageName: "sunset1"),
    Sunset(title: "레드와인과 와인잔 판매합니다. 100,000원", imageName: "sunset2"),
    Sunset(title: "그림 판매. 고흐.", imageName: "sunset3"),
    Sunset(title: "시원한 코로나 맥주 팝니다.", imageName: "sunset4"),
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


