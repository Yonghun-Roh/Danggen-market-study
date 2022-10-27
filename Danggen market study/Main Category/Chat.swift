//
//  Chat.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/15.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextView!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentFier)
        
        loadMessages()
        
        }
    
    func loadMessages() {
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                
            self.messages = []
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
                
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                       if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                           let newMessage = Message(sender: messageSender, body: messageBody)
                           self.messages.append(newMessage)
                           
                           DispatchQueue.main.async {
                           self.tableView.reloadData()
                               let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                               self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                           }
                    }
                    
                }
            }
                
        }
        
    }
    
  
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
               ]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                    
                } else {
                    print("Succesfully saved data.")
                    
                    DispatchQueue.main.async {
                         self.messageTextfield.text = ""
    }
    
    
}

   
}
        }
    }

    


   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentFier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        //This is a message from the current user.
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
//            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
//            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
        //This is a message from another sender.
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
//            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
//            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
      
      
        return cell
    }
}


    
