//
//  Untitled.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 30.10.25.
//

import UIKit

class PinSuccessViewController: UIViewController {
    
    private let back = BackgroundView()

    private let iconImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "SealCheck")
        return img
    }()
    
    private let centerLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Pin uğurla təyin edildi."
        txt.font = .systemFont(ofSize: 20, weight: .medium)
        txt.textColor = .white
        txt.textAlignment = .center
        return txt
    }()
    
    private let davamEtButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Davam et", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        btn.layer.cornerRadius = 25
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupUI()
    }
    
    private func setupViews() {
        view.addSubview(iconImage)
        view.addSubview(centerLabel)
        view.addSubview(davamEtButton)
    }
    
    private func setupUI() {
        setupBackground()
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 240).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        centerLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 19).isActive = true
        centerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 77).isActive = true
        centerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -77).isActive = true
        
        davamEtButton.translatesAutoresizingMaskIntoConstraints = false
        davamEtButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
        davamEtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        davamEtButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        davamEtButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
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
//    PinSuccessViewController()
//}
