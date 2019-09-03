//
//  ViewController.swift
//  example
//
//  Created by Daniel K. Poulsen on 03/09/2019.
//  Copyright © 2019 Daniel K. Poulsen. All rights reserved.
//

import UIKit
import EAN13View

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ean = try! EAN13(value: "5901234123457")
        let view = UIStackView(ean13: ean)
        view.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(view)
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }


}

