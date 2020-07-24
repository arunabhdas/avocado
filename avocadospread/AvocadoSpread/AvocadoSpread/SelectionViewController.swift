//
//  SelectionViewController.swift
//  AvocadoSpread
//
//  Created by Das on 7/24/20.
//  Copyright © 2020 Arunabh Das. All rights reserved.
//

import UIKit

protocol ChoiceSelectionDelegate {
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class SelectionViewController: UIViewController {

    var selectionDelegate: ChoiceSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func appleButtonTapped(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(imageLiteralResourceName: "apple"), name: "apple", color: .red)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func orangeButtonTapped(_ sender: Any) {
        selectionDelegate.didTapChoice(image: UIImage(imageLiteralResourceName: "orange"), name: "orange", color: .orange)
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
