import UIKit

class CantLoginViewController: UIViewController {
    private let switchButton = SwitchButtons()
    private let backgroundView = BackgroundView()
    
    private let topLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Daxil ola bilmirsiz?"
        txt.font = .systemFont(ofSize: 26, weight: .medium)
        txt.textColor = .white
        txt.textAlignment = .center
        return txt
    }()
    
    private let emailTextField: TextField = {
        TextField(icon: UIImage(named: "email"), placeholder: "Email")
    }()
    
    private let phoneTextField: TextField = {
        TextField(icon: UIImage(named: "phone"), placeholder: "Telefon")
    }()
    
    private let errorLabel: UILabel = {
        let txt = UILabel()
        txt.textColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0)
        txt.font = .systemFont(ofSize: 12, weight: .regular)
        txt.isHidden = true
        return txt
    }()
    
    private let davamEtButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Davam et", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    private let backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Geriyə qayıt", for: .normal)
        btn.setTitleColor(UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.layer.cornerRadius = 25
        btn.layer.borderColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0).cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupViews()
        setupUI()
        setupActions()
        setDefaultState()
        setupButton()
        
        phoneTextField.textField.delegate = self
        phoneTextField.textField.keyboardType = .numberPad
        emailTextField.textField.delegate = self
    }
    
    private func setupViews() {
        view.addSubview(topLabel)
        view.addSubview(switchButton)
        view.addSubview(emailTextField)
        view.addSubview(phoneTextField)
        view.addSubview(errorLabel)
        view.addSubview(davamEtButton)
        view.addSubview(backButton)
    }
    
    private func setupUI() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        davamEtButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            switchButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40),
            switchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            switchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            switchButton.heightAnchor.constraint(equalToConstant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            phoneTextField.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 20),
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            errorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            davamEtButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -16),
            davamEtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            davamEtButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            davamEtButton.heightAnchor.constraint(equalToConstant: 54),
            
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupActions() {
        switchButton.onSwitchChanged = { [weak self] type in
            self?.updateTextFields(for: type)
        }
    }
    
    private func setDefaultState() {
        updateTextFields(for: "email")
        switchButton.selectDefault()
    }
    
    private func updateTextFields(for type: String) {
        UIView.animate(withDuration: 0.25) {
            if type == "email" {
                self.emailTextField.isHidden = false
                self.phoneTextField.isHidden = true
                self.errorLabel.text = ""
                self.errorLabel.isHidden = true
            } else {
                self.emailTextField.isHidden = true
                self.phoneTextField.isHidden = false
                self.errorLabel.text = ""
                self.errorLabel.isHidden = true
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    private func setupButton() {
        if emailTextField.textField.text?.isEmpty ?? true || phoneTextField.textField.text?.isEmpty ?? true {
            davamEtButton.backgroundColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0)
        } else {
            davamEtButton.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        }
    }
}

extension CantLoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if textField == phoneTextField.textField {
            if string.isEmpty {
                phoneTextField.setNormalState()
                errorLabel.isHidden = true
                davamEtButton.backgroundColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0);
                return true
            } else {
                davamEtButton.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0);
            }
            
            let allowed = CharacterSet.decimalDigits
            let typedSet = CharacterSet(charactersIn: string)
            guard allowed.isSuperset(of: typedSet) else {
                phoneTextField.setErrorState()
                errorLabel.text = "Yalnız rəqəmlər daxil edin"
                errorLabel.isHidden = false
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
                    return false
                } else {
                    phoneTextField.setNormalState()
                    errorLabel.isHidden = true
                }
            }
            return true
        }
        
        if textField == emailTextField.textField {
            if let currentText = textField.text,
               let textRange = Range(range, in: currentText) {
                let updated = currentText.replacingCharacters(in: textRange, with: string)
                
                if updated.isEmpty {
                    emailTextField.setNormalState()
                    errorLabel.isHidden = true
                    return true
                }
                
                if isValidEmail(updated) {
                    emailTextField.setNormalState()
                    errorLabel.isHidden = true
                } else {
                    emailTextField.setErrorState()
                    errorLabel.text = "Email ünvanının düzgünlüyünü yoxlayın"
                    errorLabel.isHidden = false
                }
            }
            return true
        }
        
        return true
    }
}

#Preview {
    CantLoginViewController()
}
