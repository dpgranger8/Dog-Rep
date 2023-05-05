//
//  DogViewController.swift
//  Rep API
//
//  Created by David Granger on 4/24/23.
//

import UIKit

class DogViewController: UIViewController {

    @IBAction func dogButtonTouched(_ sender: Any) {
        refreshDogImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tabBarController?.tabBar.tintColor = .lightGray
        tabBarController?.tabBar.clipsToBounds = true
        tabBarController?.tabBar.layer.borderWidth = 0.5
        //tabBarController?.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        
        refreshDogImage()
    }
    
    func refreshDogImage() {
        Task {
            do {
                dogImageView.image = try await PhotoInfoController.fetchImage(from: DogAPIController.fetchItems())
            } catch {
                print("Error fetching items: \(error)")
            }
        }
    }
    
    @IBOutlet weak var dogImageView: UIImageView!

}
