//
//  Chat.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/15.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextView!
    
    var messages: [Message] = [
       Message(sender: "mogi3206", body: "안녕하세요^^."),
       Message(sender: "ryh3206", body: "안녕하세요~."),
       Message(sender: "mogi3206", body: "올려주신 물건 거래가 가능한가요?"),
       Message(sender: "ryh3206", body: "네, 가능합니다.")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                tableView.dataSource = self
        
    }
    
    @IBAction func sendPressed(_ sender: Any) {
    }
    
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentFier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].body
        return cell
    }
    }

