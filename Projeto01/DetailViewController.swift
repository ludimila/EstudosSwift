//
//  DetailViewController.swift
//  Projeto 01
//
//  Created by André Feliciano on 02/04/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var ivPicture: UIImageView!
    
    var selectedImage: String?
    var totalPictures = 0
    var selectedPicutreNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        showImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    private func configureNavigation() {
        title = "Imagem \(selectedPicutreNumber + 1) de \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    
    private func showImage() {
        if let imageToLoad = selectedImage {
            ivPicture.image  = UIImage(named: imageToLoad)
        }
    }
}
