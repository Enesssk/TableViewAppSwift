//
//  ViewController.swift
//  LandMarkAppSwift
//
//  Created by Enes Kala on 27.02.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var nameList = [String] ()
    var imageList = [UIImage] ()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        nameList.append("eiffel")
        nameList.append("galataTower")
        nameList.append("londonBridge")
        
        imageList.append(UIImage(named: "eiffel")!)
        imageList.append(UIImage(named: "galataTower")!)
        imageList.append(UIImage(named: "londonBridge")!)
        
        
        
        

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // row seçilince nolcak
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = nameList[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //kaç tane row
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = nameList[indexPath.row]
        chosenLandMarkImage = imageList[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let DestinationVC = segue.destination as! DetailsViewController
            DestinationVC.selectedName = chosenLandMarkName
            DestinationVC.selectedImage = chosenLandMarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            imageList.remove(at: indexPath.row)
            nameList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }


}

