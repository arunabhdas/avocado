//
//  ViewController.swift
//  AvocadoSpread
//  Copyright © 2020 Arunabh Das. All rights reserved.
//

import UIKit
import Combine


extension Notification.Name {
    static let newMessage = Notification.Name("newMessage")
}

struct Message {
    let content: String
    let author: String
}

class ViewController: UIViewController {

    

    @IBOutlet weak var allowMessagesLabel: UILabel!
    @IBOutlet weak var allowMessagesSwitch: UISwitch!
    @IBOutlet weak var sendMesageButton: UIButton!
    @IBOutlet weak var theMessageLabel: UILabel!
    @IBOutlet weak var pickSelectionButton: UIButton!
    @IBOutlet weak var pickChoiceButton: UIButton!
    
    @Published var canSendMessages:Bool = false
    
    private var switchSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProcessingChain()
        createObservers()
    }
    
    func createObservers() {
        // First
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateImage(notification:)), name: Constants.Notifs.oneNotif, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: Constants.Notifs.oneNotif, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: Constants.Notifs.oneNotif, object: nil)
        
        // Second
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateImage(notification:)), name: Constants.Notifs.twoNotif, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: Constants.Notifs.twoNotif, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: Constants.Notifs.twoNotif, object: nil)
    }
    
    @objc func updateImage(notification: NSNotification) {
        
    }
    
    @objc func updateLabel(notification: NSNotification) {
        self.pickChoiceButton.setTitle(notification.name.rawValue, for: .normal)
    }
    
    @objc func updateBackground(notification: NSNotification) {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupProcessingChain() {
        switchSubscriber = $canSendMessages.receive(on: DispatchQueue.main).assign(to: \.isEnabled, on: sendMesageButton)
        
        
        let messagePublisher = NotificationCenter.Publisher(center: .default, name: .newMessage)
            .map { notification -> String? in
                return (notification.object as? Message)?.content
            }
        
        let messageSubscriber = Subscribers.Assign(object: theMessageLabel, keyPath: \.text)
        
        messagePublisher.subscribe(messageSubscriber)
    }
    
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
        let message = Message(content: "The, current time is \(Date())", author: "Me")
        
        NotificationCenter.default.post(name: .newMessage, object: message)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        canSendMessages = sender.isOn
    }

    @IBAction func pickSelectionButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(identifier: "SelectionViewController") as! SelectionViewController
        selectionVC.modalPresentationStyle = .fullScreen
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
        
        
        
    }

    @IBAction func pickChoiceButtonTapped(_ sender: Any) {
        let choiceVC = storyboard?.instantiateViewController(identifier: "ChoiceViewController") as! ChoiceViewController
        choiceVC.modalPresentationStyle = .fullScreen
        present(choiceVC, animated: true, completion: nil)
        
    }
}

extension ViewController: ChoiceSelectionDelegate {
    //MARK:- ChoiceSelectionDelegate
    
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        // self.pickSelectionButton.setImage(image, for: .normal)
        self.view.backgroundColor = color
        self.pickSelectionButton.setTitle(name, for: .normal)
    }
}
