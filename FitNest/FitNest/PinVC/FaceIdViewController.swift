//
//  FaceIdViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 30.10.25.
//

import UIKit

class FaceIdViewController: UIViewController {
    
    private let back = BackgroundView()
    
    private let faceIdIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "faceId")
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(faceIdIcon)
        
        faceIdIcon.translatesAutoresizingMaskIntoConstraints = false
        faceIdIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceIdIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupBackground() {
        back.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(back, at: 0)
        back.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//#Preview {
//    FaceIdViewController()
//}
