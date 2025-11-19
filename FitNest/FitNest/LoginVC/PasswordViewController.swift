//
//  PasswordViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 30.10.25.
//

import UIKit

class PasswordViewController: UIViewController {
    
    private let backgroundView = BackgroundView()
    private let switchB = SwitchButtons()
    
    private let topLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Şifrəni yenilə"
        txt.font = .systemFont(ofSize: 26, weight: .regular)
        txt.textColor = .white
        return txt
    }()
    
    private let emailTextField: TextField = {
        let icon = UIImage(named: "email")
        return TextField(icon: icon, placeholder: "Email")
    }()
    
    private let phoneTextField: TextField = {
        let icon = UIImage(named: "phone")
        return TextField(icon: icon, placeholder: "+994")
    }()
    
    private let daxilOlButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Daxil ol", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(handleSubmitButton), for: .touchUpInside)
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
        setupActions()
        setupText()
        
        setDefaultState()
        navigationItem.hidesBackButton = true
    }
    
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(topLabel)
        view.addSubview(switchB)
        view.addSubview(emailTextField)
        view.addSubview(phoneTextField)
        view.addSubview(daxilOlButton)
        view.addSubview(bottomLabel)
    }
    
    private func setupUI() {
        setupBackground()
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        switchB.translatesAutoresizingMaskIntoConstraints = false
        switchB.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40).isActive = true
        switchB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        switchB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        switchB.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: switchB.bottomAnchor, constant: 20).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.topAnchor.constraint(equalTo: switchB.bottomAnchor, constant: 20).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        daxilOlButton.translatesAutoresizingMaskIntoConstraints = false
        daxilOlButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        daxilOlButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        daxilOlButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        daxilOlButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        daxilOlButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.topAnchor.constraint(equalTo: daxilOlButton.bottomAnchor, constant: 25).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 131).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -131).isActive = true
    }
    
    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupActions() {
        switchB.onSwitchChanged = { [weak self] type in
               guard let self = self else { return }
               self.updateTextFields(for: type)
           }
       }
    
    private func setDefaultState() {
        updateTextFields(for: "email")
        switchB.selectDefault()
      }
    
    private func updateTextFields(for type: String) {
            UIView.animate(withDuration: 0.25) {
                if type == "email" {
                    self.emailTextField.isHidden = false
                    self.phoneTextField.isHidden = true
                } else {
                    self.emailTextField.isHidden = true
                    self.phoneTextField.isHidden = false
                }
            }
        }
    
    private func setupText() {
        let fullText = "Hesabın var? Daxil ol"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        attributedString.addAttributes([
            .foregroundColor: UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0),
            .font: UIFont.systemFont(ofSize: 14)
        ], range: NSRange(location: 0, length: fullText.count))
        
        let regRange = (fullText as NSString).range(of: "Daxil ol")
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
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc private func handleSubmitButton() {
        let resetVC = ResetPasswordViewController()
        navigationController?.pushViewController(resetVC, animated: true)
    }
    
}

//#Preview {
//    PasswordViewController()
//}
