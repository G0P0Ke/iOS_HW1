//
//  ViewController.swift
//  aaandreev_4PW1
//
//  Created by  Антон Андреев on 17.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var views: [UIView]!
    var set = Set<UIColor>()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillSet()
        setUp()
    }

    @IBAction func changeColorButtonPressed(_ sender: Any) {
        fillSet()
        let button = sender as? UIButton
        button?.isEnabled = false
        UIView.animate(withDuration: 1, animations: {
            self.setUp()
        }) { completion in button?.isEnabled = true
        }
    }
    
    func fillSet(){
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
         }
    }
    
    func setUp(){
        for view in self.views {
            view.layer.cornerRadius = .random(in: 10...60)
            view.backgroundColor = self.set.popFirst()
        }
    }
}

