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
    
    private let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "avatar")
        iv.layer.cornerRadius = 60
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let editAvatarButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "edit"), for: .normal)
        return btn
    }()
    
    private let nameLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Leyla Abdullayeva"
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 18, weight: .medium)
        return txt
    }()
    
    private let profilLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Profil"
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 16, weight: .medium)
        return txt
    }()
    
    private let personalInfoButton = MenuButton(
            icon: UIImage(named: "user"),
            title: "Şəxsi məlumatlar",
            arrow: UIImage(named: "right")
        )
    
    private let secimlerLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Seçimlər"
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 16, weight: .medium)
        return txt
    }()
    
    private let hesabLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Hesab"
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 16, weight: .medium)
        return txt
    }()
    
    private let secimlerGroup = MenuButtonGroup()
    private let hesabGroup = MenuButtonGroup()
    
    private let exitButton = MenuButton(
        icon: UIImage(named: "exit"),
        title: "Çıxış"
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupViews()
        setupUI()
        
        setupUIButtons()
        exitButton.layer.borderColor = UIColor(red: 97/255, green: 101/255, blue: 108/255, alpha: 1.0).cgColor

    }
    
    private func setupViews() {
        view.addSubview(backButton)
        view.addSubview(topLabel)
        view.addSubview(settingsButton)
        view.addSubview(avatarImageView)
        view.addSubview(editAvatarButton)
        view.addSubview(nameLabel)
        view.addSubview(profilLabel)
        view.addSubview(personalInfoButton)
        view.addSubview(secimlerLabel)
        view.addSubview(secimlerGroup)
        view.addSubview(hesabLabel)
        view.addSubview(hesabGroup)
        view.addSubview(exitButton)
    }
    
    private func setupUI() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        editAvatarButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profilLabel.translatesAutoresizingMaskIntoConstraints = false
        personalInfoButton.translatesAutoresizingMaskIntoConstraints = false
        secimlerLabel.translatesAutoresizingMaskIntoConstraints = false
        secimlerGroup.translatesAutoresizingMaskIntoConstraints = false
        hesabLabel.translatesAutoresizingMaskIntoConstraints = false
        hesabGroup.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 76).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 74).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        settingsButton.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 117).isActive = true
        settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        avatarImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 44).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140.5).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -141.5).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        editAvatarButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 128).isActive = true
        editAvatarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -146).isActive = true
        editAvatarButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        profilLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40).isActive = true
        profilLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        personalInfoButton.topAnchor.constraint(equalTo: profilLabel.bottomAnchor, constant: 10).isActive = true
        personalInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        personalInfoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        personalInfoButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        secimlerLabel.topAnchor.constraint(equalTo: personalInfoButton.bottomAnchor, constant: 28).isActive = true
        secimlerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        secimlerGroup.topAnchor.constraint(equalTo: secimlerLabel.bottomAnchor, constant: 10).isActive = true
        secimlerGroup.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        secimlerGroup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        hesabLabel.topAnchor.constraint(equalTo: secimlerGroup.bottomAnchor, constant: 28).isActive = true
        hesabLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        hesabGroup.topAnchor.constraint(equalTo: hesabLabel.bottomAnchor, constant: 10).isActive = true
        hesabGroup.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        hesabGroup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        exitButton.topAnchor.constraint(equalTo: hesabGroup.bottomAnchor, constant: 28).isActive = true
        exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
    
    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupUIButtons(){
        personalInfoButton.onTap = { [weak self] in
            print("Personal info tapped")
        }
        
        secimlerGroup.addMenuItem(
            icon: UIImage(named: "bell"),
            title: "Bildirişlər")
        {
            print("Salam alekum")
        }
        
        secimlerGroup.addMenuItem(
            icon: UIImage(named: "global"),
            title: "Dil",
            subtitle: "Azərbaycan")
        {
            print("Language tapped")
        }
        
        hesabGroup.addMenuItem(
            icon: UIImage(named: "key"),
            title: "Parol")
        {
            print( "Password tapped")
        }
        
        hesabGroup.addMenuItem(
            icon: UIImage(named: "faceId"),
            title: "Face ID ilə giriş")
        {
            print("faceid tapped")
        }
        
        exitButton.onTap = { [weak self] in
            print("Exit tapped")
        }
        
        
    }
    
 
}



