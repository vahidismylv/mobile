//
//  ResetPasswordViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 30.10.25.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    private let back = BackgroundView()
    
    private let topLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Şifrəni yaz"
        txt.font = .systemFont(ofSize: 26, weight: .regular)
        txt.textColor = .white
        return txt
    }()
    
    private let passwordTextField: TextField = {
        let icon = UIImage(named: "lock")
        return TextField(icon: icon, placeholder: "Yeni Şifrə", isSecure: true)
    }()
    
    private let resetPasswordTextField: TextField = {
        let icon = UIImage(named: "lock")
        return TextField(icon: icon, placeholder: "Təkrar Şifrə", isSecure: true)
    }()
    
    private let daxilOlButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Daxil ol", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupUI()
        setupText()
        
        navigationItem.hidesBackButton = true
    }
    
    private func setupBackground() {
        back.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(back, at: 0)
        back.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        back.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupViews() {
        view.addSubview(back)
        view.addSubview(topLabel)
        view.addSubview(passwordTextField)
        view.addSubview(resetPasswordTextField)
        view.addSubview(daxilOlButton)
        view.addSubview(bottomLabel)
    }
    
    private func setupUI() {
        setupBackground()
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        
        resetPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        resetPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        resetPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        
        daxilOlButton.translatesAutoresizingMaskIntoConstraints = false
        daxilOlButton.topAnchor.constraint(equalTo: resetPasswordTextField.bottomAnchor, constant: 326).isActive = true
        daxilOlButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        daxilOlButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        daxilOlButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        daxilOlButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.topAnchor.constraint(equalTo: daxilOlButton.bottomAnchor, constant: 25).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 83.5).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -83.5).isActive = true

    }
    
    private func setupText() {
        let fullText = "Hesabın yoxdur? Qeydiyyatdan keç"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        attributedString.addAttributes([
            .foregroundColor: UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0),
            .font: UIFont.systemFont(ofSize: 14)
        ], range: NSRange(location: 0, length: fullText.count))
        
        let regRange = (fullText as NSString).range(of: "Qeydiyyatdan keç")
        attributedString.addAttributes([
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ], range: regRange)
        
        bottomLabel.attributedText = attributedString
        
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRegistrationTap))
        bottomLabel.addGestureRecognizer(tapGesture)
    }

    @objc private func handleRegistrationTap() {
        let registerVC = RegistrationViewController()
        navigationController?.pushViewController(registerVC, animated: true)

    }

}

//#Preview {
//    ResetPasswordViewController()
//}
