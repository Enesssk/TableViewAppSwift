//
//  DetailsViewController.swift
//  LandMarkAppSwift
//
//  Created by Enes Kala on 27.02.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedName = ""
    var selectedImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLabel.text = selectedName
        imageView.image = selectedImage
        
    }
    


}
