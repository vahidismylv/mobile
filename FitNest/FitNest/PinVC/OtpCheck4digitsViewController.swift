//
//  OtpCheck4digitsViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 02.11.25.
//

import UIKit

class OtpCheck4digitsViewController: UIViewController {
    private let back = BackgroundView()
    
    private let topLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Təsdiq kodunu daxil edin"
        txt.font = .systemFont(ofSize: 20, weight: .regular)
        txt.textAlignment = .center
        txt.textColor = .white
        return txt
    }()
    
    private let bottomLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Email ünvanınıza göndərilən təsdiq kodunu daxil edin: ley*@gmail.com"
        txt.textAlignment = .center
        txt.numberOfLines = 0
        txt.textColor = .lightGray
        txt.font = .systemFont(ofSize: 14, weight: .regular)
        return txt
    }()
    
    private var otpTextFields: [UITextField] = []
    private let otpStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 6
        return stack
    }()
    
    private let timerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Kodu almadınız?"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()

    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:20"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    private let resendButton: UIButton = {
        let btn = UIButton(type: .system)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: "Yenidən göndər", attributes: attributes)
        btn.setAttributedTitle(attributedTitle, for: .normal)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private let errorLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Yanlış kod, yenidən cəhd edin"
        txt.textAlignment = .center
        txt.textColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0)
        txt.font = .systemFont(ofSize: 12, weight: .regular)
        return txt
    }()
    
    private let continueButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Davam et", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0)
        return btn
    }()
    
    private var timer: Timer?
    private var timeRemaining = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupViews()
        setupUI()
        setupOTPFields()
        /*startTimer*/()
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
        view.addSubview(bottomLabel)
        view.addSubview(otpStackView)
        view.addSubview(timerInfoLabel)
        view.addSubview(timerLabel)
        view.addSubview(resendButton)
        view.addSubview(errorLabel)
        view.addSubview(continueButton)
    }
    
    private func setupUI() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54).isActive = true
        bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54).isActive = true
        
        otpStackView.translatesAutoresizingMaskIntoConstraints = false
        otpStackView.topAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: 96).isActive = true
        otpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82).isActive = true
        otpStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82).isActive = true
        otpStackView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        // Timer Info и Timer слева
        timerInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        timerInfoLabel.topAnchor.constraint(equalTo: otpStackView.bottomAnchor, constant: 20).isActive = true
        timerInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
            
            // Timer Label (слева снизу под info)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.topAnchor.constraint(equalTo: timerInfoLabel.bottomAnchor, constant: 4).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: timerInfoLabel.centerXAnchor).isActive = true
            
            // Resend Button (справа, по центру относительно таймера)
        resendButton.translatesAutoresizingMaskIntoConstraints = false
        resendButton.topAnchor.constraint(equalTo: otpStackView.bottomAnchor, constant: 13).isActive = true
        resendButton.leadingAnchor.constraint(equalTo: timerInfoLabel.trailingAnchor, constant: 16).isActive = true
        resendButton.isHidden = false
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.topAnchor.constraint(equalTo: otpStackView.bottomAnchor, constant: 20).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66).isActive = true
        errorLabel.isHidden = true
        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56).isActive = true
        continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        
   
    }
    
    private func setupOTPFields() {
        for i in 0..<4 {
            let textField = createOTPTextField(tag: i)
            otpTextFields.append(textField)
            otpStackView.addArrangedSubview(textField)
        }
        
        otpTextFields.first?.becomeFirstResponder()
    }
    
    private func createOTPTextField(tag: Int) -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0)
        tf.textColor = .white
        tf.font = .systemFont(ofSize: 24, weight: .semibold)
        tf.textAlignment = .center
        tf.keyboardType = .numberPad
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor(red: 97/255, green: 101/255, blue: 108/255, alpha: 1.0).cgColor
//        tf.layer.borderColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0).cgColor
        tf.tag = tag
        tf.delegate = self
        tf.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            
        return tf
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.isEmpty {
            updateTextFieldBorder(textField)
            checkOTPCompletion()
            
            if textField.tag > 0 {
                otpTextFields[textField.tag - 1].becomeFirstResponder()
            }
            return
        }
        
        if text.count > 1 {
            textField.text = String(text.prefix(1))
        }
        
        updateTextFieldBorder(textField)
        
        if textField.tag < otpTextFields.count - 1 {
            otpTextFields[textField.tag + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        checkOTPCompletion()
    }
    
    @objc private func resendButtonTapped() {
        otpTextFields.forEach { textField in
            textField.text = ""
            updateTextFieldBorder(textField)
        }
        
        otpTextFields.first?.becomeFirstResponder()
        
        startTimer()
        
        print("Отправка нового кода...")
    }
    
    private func updateTextFieldBorder(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.borderWidth = 1
        } else {
            textField.layer.borderColor = UIColor(red: 97/255, green: 101/255, blue: 108/255, alpha: 1.0).cgColor
            textField.layer.borderWidth = 1
        }
    }
    
    private func checkOTPCompletion() {
        let isComplete = otpTextFields.allSatisfy { ($0.text?.count ?? 0) > 0 }
        
        if isComplete {
            continueButton.isEnabled = true
            continueButton.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        } else {
            continueButton.isEnabled = false
            continueButton.backgroundColor = UIColor(red: 206/255, green: 207/255, blue: 210/255, alpha: 1.0)
        }
    }
    
    private func startTimer() {
        timer?.invalidate()
        timeRemaining = 20
        resendButton.isEnabled = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                let minutes = self.timeRemaining / 60
                let seconds = self.timeRemaining % 60
                self.timerLabel.text = String(format: "Kodu almadınız? %02d:%02d", minutes, seconds)
            } else {
                self.timer?.invalidate()
                self.resendButton.isEnabled = true
//                self.timerLabel.text = "Kodu almadınız?"
            }
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}


extension OtpCheck4digitsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if string.isEmpty {
            return true
        }
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 1 && allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTextFieldBorder(textField)
    }
    
}

//#Preview {
//    OtpCheck4digitsViewController()
//}


