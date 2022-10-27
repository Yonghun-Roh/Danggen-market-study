//
//  Chat.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/15.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentFier, for: indexPath)
        as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var messageTextfield: UITextView!
    
    @IBOutlet weak var messageTextfield: UITextView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
       Message(sender: "mogi3206", body: "안녕하세요^^."),
       Message(sender: "ryh3206", body: "안녕하세요~."),
       Message(sender: "mogi3206", body: "올려주신 물건 거래가 가능한가요?"),
       Message(sender: "ryh3206", body: "네, 가능합니다.")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentFier)
        
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender,
                                                                      K.FStore.bodyField: messageBody
                                                                     ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                    
                } else {
                    print("Succesfully saved data.")
    }
    
    
}

//extension ChatViewController: UITableViewDataSource {
   
}
        }
    }


        
