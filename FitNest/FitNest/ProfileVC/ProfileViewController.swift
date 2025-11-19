//
//  ProfileViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 19.11.25.
//

import UIKit

class ProfileViewController: UIViewController {
    private let backgroundView = BackgroundView()
    
    private let backButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "back"), for: .normal)
        return btn
    }()
    
    private let topLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Profil"
        txt.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        txt.textColor = .white
        return txt
    }()
    
    private let settingsButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "settings"), for: .normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupUI()
    }
    
    private func setupViews() {
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(settingsButton)
    }
    
    private func setupUI() {
        setupBackground()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 76).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        settingsButton.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 117).isActive = true
        settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//#Preview {
//    ProfileViewController()
//}
