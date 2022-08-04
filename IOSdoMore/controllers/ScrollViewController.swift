//
//  ScrollViewController.swift
//  IOSdoMore
//
//  Created by Habibulloh on 04/08/22.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
initViews()
        // Do any additional setup after loading the view.
    }
    
    func initViews(){
        addNavigationBar()
    }
    func addNavigationBar(){
        let back = UIImage(named: "ic_back")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
        title = "Scroll View"
    }
   //Mark:Action
    @objc func backTapped(){
        navigationController?.popViewController(animated: true)
    }
}
