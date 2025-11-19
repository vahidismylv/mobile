//
//  FaceIdAccessViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 30.10.25.
//

import UIKit

class FaceIdAccessViewController: UIViewController {
    
    private let back = BackgroundView()
    
    private let topLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Face ID ilə sürətli və təhlükəsiz giriş"
        txt.font = .systemFont(ofSize: 20, weight: .medium)
        txt.textColor = .white
        txt.textAlignment = .center
        return txt
    }()
    
    private let centerLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Biometrik məlumatlarınızla hesabınıza sürətli və təhlükəsiz şəkildə daxil ola bilərsiniz."
        txt.font = .systemFont(ofSize: 16, weight: .regular)
        txt.textColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0)
        txt.textAlignment = .center
        txt.numberOfLines = 0
        return txt
    }()
    
    private let aktivEtButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Aktiv Et", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    private let dahaSonraButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Daha sonra", for: .normal)
        btn.setTitleColor(UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
//        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 25
        btn.layer.borderColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0).cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupUI()
    }
    
    private func setupViews() {
        view.addSubview(topLabel)
        view.addSubview(centerLabel)
        view.addSubview(aktivEtButton)
        view.addSubview(dahaSonraButton)
    }
    
    private func setupUI() {
        setupBackground()
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 514).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29).isActive = true
        
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        centerLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 16).isActive = true
        centerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29).isActive = true
        centerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29).isActive = true
        
        aktivEtButton.translatesAutoresizingMaskIntoConstraints = false
        aktivEtButton.topAnchor.constraint(equalTo: centerLabel.bottomAnchor, constant: 88).isActive = true
        aktivEtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        aktivEtButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        aktivEtButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        aktivEtButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        dahaSonraButton.translatesAutoresizingMaskIntoConstraints = false
        dahaSonraButton.topAnchor.constraint(equalTo: aktivEtButton.bottomAnchor, constant: 16).isActive = true
        dahaSonraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        dahaSonraButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        dahaSonraButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        dahaSonraButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
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
//    FaceIdAccessViewController()
//}
