//
//  newsViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 19/02/2022.
//

import UIKit

class newsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var discription: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
   
    
    public func configure(title :  String){
        self.titleLabel.text =  title
    }
    
  
    
}
