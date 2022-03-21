//
//  ResourceViewController.swift
//  immi
//
//  Created by user217004 on 3/19/22.
//

import UIKit

class ResourceViewController: UIViewController {

    //MARK: - Properties
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Resources"
       
    }
    
}
