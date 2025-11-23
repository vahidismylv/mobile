////
////  SelfInfoViewController.swift
////  FitNest
////
////  Created by Vahid Ismayilov on 20.11.25.
////


import UIKit

class SelfInfoViewController: UIViewController {
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
    
    private let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Yadda saxla", for: .normal)
        btn.setTitleColor(UIColor(red: 0, green: 180/255, blue: 204/255, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
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
        btn.setImage(UIImage(named: "editGray"), for: .normal)
        return btn
    }()
    
    private let nameLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Leyla Abdullayeva"
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 18, weight: .medium)
        return txt
    }()
    
    private lazy var adLabel = createSectionLabel(text: "Ad")
    private lazy var soyadLabel = createSectionLabel(text: "Soyad")
    private lazy var emailLabel = createSectionLabel(text: "Email")
    private lazy var phoneLabel = createSectionLabel(text: "Mobil nömrə")
    
    private lazy var nameTextField = createTextField(placeholder: "Ad")
    private lazy var soyadTextField = createTextField(placeholder: "Soyad")
    private lazy var emailTextField = createTextField(placeholder: "Email")
    private lazy var phoneTextField = createTextField(placeholder: "+994")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupViews()
        setupUI()
    }
    
    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupViews() {
        [backButton, topLabel, saveButton, avatarImageView, editAvatarButton,
        nameLabel, adLabel, nameTextField, soyadLabel, soyadTextField,
        emailLabel, emailTextField, phoneLabel, phoneTextField].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupUI() {
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 144).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 71).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 86).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        
        avatarImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 54).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140.5).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -141.5).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        editAvatarButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 138).isActive = true
        editAvatarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -146).isActive = true
        editAvatarButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 123).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -124).isActive = true
        
        adLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40).isActive = true
        adLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: adLabel.bottomAnchor, constant: 10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        soyadLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 28).isActive = true
        soyadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        soyadTextField.topAnchor.constraint(equalTo: soyadLabel.bottomAnchor, constant: 10).isActive = true
        soyadTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        soyadTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        soyadTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: soyadTextField.bottomAnchor, constant: 28).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        phoneLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 28).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        editAvatarButton.addTarget(self, action: #selector(editAvatarTapped), for: .touchUpInside)
    }
    
    private func createSectionLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(red: 0, green: 180/255, blue: 204/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 12/255, green: 14/255, blue: 18/255, alpha: 1.0)
        textField.textColor = .white
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 12
            
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0),
                .font: UIFont.systemFont(ofSize: 16, weight: .regular)
            ]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 48))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }
    
    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func editAvatarTapped() {
        print("Edit avatar tapped")
        // Добавь логику выбора фото
    }
    
    @objc private func saveTapped() {
        print("Save tapped")
        // Добавь логику сохранения
    }
    
    
}


