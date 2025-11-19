//
//  ViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 25.10.25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let backgroundView = BackgroundView()
    
    private let daxilOlLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Daxil ol"
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 26, weight: .regular)
        return txt
    }()
    
    private let emailTextField: TextField = {
        let icon = UIImage(named: "email")
        return TextField(icon: icon, placeholder: "Email")
    }()
    
    private let passwordTextField: TextField = {
        let icon = UIImage(named: "lock")
        return TextField(icon: icon, placeholder: "Şifrə", isSecure: true)
    }()
    
    private let errorLabel: UILabel = {
        let txt = UILabel()
        txt.textColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0)
        txt.font = .systemFont(ofSize: 12, weight: .regular)
        txt.textAlignment = .center
        return txt
    }()
    
    private let forgotButton: UIButton = {
        let btn = UIButton()
        btn.setTitle( "Şifrəni unutmusan?", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        btn.addTarget(self, action: #selector(handleForgotPasswordTap), for: .touchUpInside)
        return btn
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
        setupBack()
        setupUI()
        setupText()
        setupButton()
        
        navigationItem.hidesBackButton = true
        passwordTextField.textField.delegate = self
        emailTextField.textField.delegate = self

    }
    
    private func setupViews() {
        view.addSubview(daxilOlLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(errorLabel)
        view.addSubview(forgotButton)
        view.addSubview(daxilOlButton)
        view.addSubview(bottomLabel)
    }
    
    private func setupBack() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupUI() {
        daxilOlLabel.translatesAutoresizingMaskIntoConstraints = false
        daxilOlLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 200).isActive = true
        daxilOlLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: daxilOlLabel.bottomAnchor, constant: 40).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true

        
        forgotButton.translatesAutoresizingMaskIntoConstraints = false
        forgotButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 19).isActive = true
        forgotButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22).isActive = true
        
        daxilOlButton.translatesAutoresizingMaskIntoConstraints = false
        daxilOlButton.topAnchor.constraint(equalTo: forgotButton.bottomAnchor, constant: 294).isActive = true
        daxilOlButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        daxilOlButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        daxilOlButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        daxilOlButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38).isActive = true
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
    
    private func setupButton() {
        let email = emailTextField.textField.text ?? ""
        let pass = passwordTextField.textField.text ?? ""
        
        if email.isEmpty || pass.isEmpty {
            daxilOlButton.backgroundColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0)
        } else {
            daxilOlButton.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        }
    }
    
    @objc private func handleForgotPasswordTap() {
        let passwordVC = PasswordViewController()
        navigationController?.pushViewController(passwordVC, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == passwordTextField.textField {
            
            if string.isEmpty {
                passwordTextField.setNormalState()
                errorLabel.isHidden = true
                daxilOlButton.backgroundColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0)
                return true
            } else {
                daxilOlButton.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
            }
            
            let minLength = 8
            if let currentText = textField.text,
               let textRange = Range(range, in: currentText) {
                let updatedText = currentText.replacingCharacters(in: textRange, with: string)
                
                if updatedText.count < minLength {
                    passwordTextField.setErrorState()
                    errorLabel.isHidden = false
                    errorLabel.text = "*Yanlış şifrə, yenidən cəhd edin"
                } else {
                    passwordTextField.setNormalState()
                    errorLabel.isHidden = true
                }
            }
        }
        
        return true
    }
}

//#Preview {
//    LoginViewController()
//}
