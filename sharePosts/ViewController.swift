//
//  ViewController.swift
//  sharePosts
//
//  Created by NareshNaidu on 15/06/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    @IBAction func share(_ sender: Any) {
        
        let alert = UIAlertController(title: "share", message: "Poem of The Day!", preferredStyle: .actionSheet)
        let actionOne = UIAlertAction(title: "Share On Facebook", style: .default) { (action) in
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            post.setInitialText("Poem of The Day!")
            post.add(UIImage(named: "Dad.jpg"))
            self.present(post, animated: true, completion: nil)
        } else {self.showAlert(service: "Facebook") }
            
        }
        alert.addAction(actionOne)
        self.present(alert, animated: true, completion: nil)
        
    }
    func showAlert(service: String) {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

