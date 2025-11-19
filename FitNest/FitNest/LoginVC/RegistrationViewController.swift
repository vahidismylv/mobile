//
//  RegistrationViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 25.10.25.
//

import UIKit

class RegistrationViewController: UIViewController {
   
    private let switchButtons = SwitchButtons()
    private let backgroundView = BackgroundView()
    private var errorLabelHeightConstraint: NSLayoutConstraint?


    private let qeydiyyatLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Qeydiyyat"
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return txt
    }()
    
    private let nameTextField: TextField = {
        let icon = UIImage(named: "user")
        return TextField(icon: icon, placeholder: "Ad, Soyad")
    }()
    
    private let emailTextField: TextField = {
        let icon = UIImage(named: "email")
        return TextField(icon: icon, placeholder: "Email")
    }()
    
    private let phoneTextField: TextField = {
        let icon = UIImage(named: "phone")
        return TextField(icon: icon, placeholder: "+994")
    }()
    
    private let errorLabel: UILabel = {
        let txt = UILabel()
        txt.textColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0)
        txt.font = .systemFont(ofSize: 12, weight: .regular)
        txt.textAlignment = .center
        return txt
    }()
    
    private let passwordTextField: TextField = {
        let icon = UIImage(named: "lock")
        return TextField(icon: icon, placeholder: "Şifrə")
    }()
    
    private let qeydiyyatOlButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Qeydiyyat Ol", for: .normal)
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
        setupActions()
        setupText()
        
        setDefaultState()
        setupBackground()
        
        navigationItem.hidesBackButton = true
        emailTextField.textField.delegate = self
        phoneTextField.textField.delegate = self
        nameTextField.textField.delegate = self
        passwordTextField.textField.delegate = self
        
        nameTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        emailTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        phoneTextField.textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        
        updateRegisterButtonState()
            
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
        view.addSubview(qeydiyyatLabel)
        view.addSubview(nameTextField)
        view.addSubview(switchButtons)
        view.addSubview(emailTextField)
        view.addSubview(phoneTextField)
        view.addSubview(errorLabel)
        view.addSubview(passwordTextField)
        view.addSubview(qeydiyyatOlButton)
        view.addSubview(bottomLabel)
    }
    
    private func setupUI() {
        qeydiyyatLabel.translatesAutoresizingMaskIntoConstraints = false
        qeydiyyatLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        qeydiyyatLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: qeydiyyatLabel.bottomAnchor, constant: 44).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        switchButtons.translatesAutoresizingMaskIntoConstraints = false
        switchButtons.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        switchButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        switchButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        switchButtons.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: switchButtons.bottomAnchor, constant: 20).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
//        emailTextField.heightAnchor.constraint(equalToConstant: 52).isActive = true

        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 6).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        errorLabelHeightConstraint = errorLabel.heightAnchor.constraint(equalToConstant: 0)
        errorLabelHeightConstraint?.isActive = true
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.topAnchor.constraint(equalTo: switchButtons.bottomAnchor, constant: 20).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true


        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        qeydiyyatOlButton.translatesAutoresizingMaskIntoConstraints = false
        qeydiyyatOlButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 214).isActive = true
        qeydiyyatOlButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        qeydiyyatOlButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        qeydiyyatOlButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        qeydiyyatOlButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.topAnchor.constraint(equalTo: qeydiyyatOlButton.bottomAnchor, constant: 26).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 131).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -131).isActive = true

        
    }
    
    private func setupActions() {
           switchButtons.onSwitchChanged = { [weak self] type in
               guard let self = self else { return }
               self.updateTextFields(for: type)
           }
       }
    
    private func setDefaultState() {
          updateTextFields(for: "email")
          switchButtons.selectDefault()
      }
    
    private func updateTextFields(for type: String) {
        UIView.animate(withDuration: 0.25) {
            if type == "email" {
                self.emailTextField.isHidden = false
                self.phoneTextField.isHidden = true
                self.errorLabel.text = ""
                self.errorLabel.isHidden = true
                self.phoneTextField.textField.text = ""
                self.passwordTextField.textField.text = ""
            } else {
                self.emailTextField.isHidden = true
                self.phoneTextField.isHidden = false
                self.errorLabel.text = ""
                self.errorLabel.isHidden = true
                self.emailTextField.textField.text = ""
                self.passwordTextField.textField.text = ""
            }
            self.updateRegisterButtonState()
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
    
    private func validEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    private func updateRegisterButtonState() {
        // 1. Получаем текст из всех полей
        let name = nameTextField.textField.text ?? ""
        let password = passwordTextField.textField.text ?? ""
        
        // 2. Проверяем что имя и пароль не пустые
        let isNameValid = !name.isEmpty
        let isPasswordValid = !password.isEmpty

        // 3. Определяем какой режим активен (email или телефон)
        let isEmailMode = !emailTextField.isHidden

        var isFormValid = false

        // 4. Проверяем в зависимости от режима
        if isEmailMode {
            // Режим EMAIL
            let email = emailTextField.textField.text ?? ""
            let isEmailValid = validEmail(email) && !email.isEmpty
            
            // ВСЕ должно быть правильно: имя + email + пароль + НЕТ ошибок
            isFormValid = isNameValid && isEmailValid && isPasswordValid && errorLabel.isHidden
        } else {
            // Режим ТЕЛЕФОН
            let phone = phoneTextField.textField.text ?? ""
            let digits = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            let isPhoneValid = (digits.count == 9)
            
            // ВСЕ должно быть правильно: имя + телефон + пароль + НЕТ ошибок
            isFormValid = isNameValid && isPhoneValid && isPasswordValid && errorLabel.isHidden
        }

        // 5. Включаем или отключаем кнопку
        if isFormValid {
            // Всё правильно - кнопка АКТИВНА и ГОЛУБАЯ
            qeydiyyatOlButton.isEnabled = true
            qeydiyyatOlButton.backgroundColor = UIColor(
                red: 0/255, green: 205/255, blue: 232/255, alpha: 1
            )
        } else {
            // Что-то не так - кнопка НЕАКТИВНА и СЕРАЯ
            qeydiyyatOlButton.isEnabled = false
            qeydiyyatOlButton.backgroundColor = UIColor(
                red: 206/255, green: 207/255, blue: 210/255, alpha: 1
            )
        }
    }
    
    @objc private func textFieldsDidChange() {
        updateRegisterButtonState()
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == phoneTextField.textField {
            
            if string.isEmpty {
                phoneTextField.setNormalState()
                errorLabel.isHidden = true
                
                UIView.animate(withDuration: 0.25) {
                    self.errorLabelHeightConstraint?.constant = 0
                    self.view.layoutIfNeeded()
                }
                
                self.updateRegisterButtonState()
                return true
            }
            
            
            qeydiyyatOlButton.backgroundColor = UIColor(
                red: 0/255, green: 205/255, blue: 232/255, alpha: 1
            )
            
            
            let allowed = CharacterSet.decimalDigits
            let typedSet = CharacterSet(charactersIn: string)
            
            if !allowed.isSuperset(of: typedSet) {
                phoneTextField.setErrorState()
                errorLabel.text = "Yalnız rəqəmlər daxil edin"
                errorLabel.isHidden = false
                
                UIView.animate(withDuration: 0.25) {
                    self.errorLabelHeightConstraint?.constant = 18
                    self.view.layoutIfNeeded()
                }
                
                return false
            }
            
            
            let maxDigits = 9
            
            if let currentText = textField.text,
               let textRange = Range(range, in: currentText) {
                
                let updated = currentText.replacingCharacters(in: textRange, with: string)
                let digits = updated.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                
                if digits.count > maxDigits {
                    phoneTextField.setErrorState()
                    errorLabel.text = "Mobil nömrənizin düzgünlüyünü yoxlayın"
                    errorLabel.isHidden = false
                    
                    UIView.animate(withDuration: 0.25) {
                        self.errorLabelHeightConstraint?.constant = 18
                        self.view.layoutIfNeeded()
                    }
                    
                    return false
                }
            }
            
            
            phoneTextField.setNormalState()
            errorLabel.isHidden = true
            
            UIView.animate(withDuration: 0.25) {
                self.errorLabelHeightConstraint?.constant = 0
                self.view.layoutIfNeeded()
            }
            
            self.updateRegisterButtonState()
            return true
        }
        
        if textField == emailTextField.textField {
            
            if let currentText = textField.text,
               let textRange = Range(range, in: currentText) {
                
                let updated = currentText.replacingCharacters(in: textRange, with: string)
                
                if updated.isEmpty {
                    
                    emailTextField.setNormalState()
                    errorLabel.isHidden = true
                    
                    UIView.animate(withDuration: 0.25) {
                        self.errorLabelHeightConstraint?.constant = 0
                        self.view.layoutIfNeeded()
                    }
                    
                    self.updateRegisterButtonState()

                    
                    return true
                }
                
                self.updateRegisterButtonState()

                
                if validEmail(updated) {
                    
                    emailTextField.setNormalState()
                    errorLabel.isHidden = true
                    
                    UIView.animate(withDuration: 0.25) {
                        self.errorLabelHeightConstraint?.constant = 0
                        self.view.layoutIfNeeded()
                    }
                    
                } else {
                    
                    emailTextField.setErrorState()
                    errorLabel.text = "Email ünvanının düzgünlüyünü yoxlayın"
                    errorLabel.isHidden = false
                    
                    UIView.animate(withDuration: 0.25) {
                        self.errorLabelHeightConstraint?.constant = 18
                        self.view.layoutIfNeeded()
                    }
                }
            }
            
            return true
        }
        return true
    }
}

//#Preview {
//    RegistrationViewController()
//}
