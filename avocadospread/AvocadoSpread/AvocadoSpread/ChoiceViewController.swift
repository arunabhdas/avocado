//
//  ChoiceViewController.swift
//  AvocadoSpread
//
//  Created by Das on 7/24/20.
//  Copyright © 2020 Arunabh Das. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: Constants.Notifs.oneNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func secondButtonTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: Constants.Notifs.twoNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
