//
//  PinVerifyViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 19.11.25.
//

import UIKit

class PinVerifyViewController: UIViewController {
    
    private let backgroundView = BackgroundView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pin-i təsdiqləyin"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Təhlükəsizlik üçün  Pin-i yenidən daxil edin."
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 148/255, green: 151/255, blue: 156/255, alpha: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let dotsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 32
        return stack
    }()
    
    private var dotViews: [UIView] = []
    private var pinCode: String = ""
    
    private let hiddenTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.isHidden = true
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupUI()
        setupDots()
        
        hiddenTextField.delegate = self
        hiddenTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hiddenTextField.becomeFirstResponder()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(dotsStackView)
        view.addSubview(hiddenTextField)
    }
    
    private func setupDots() {
        for _ in 0..<4 {
            let dotView = UIView()
            dotView.backgroundColor = .clear
            dotView.layer.cornerRadius = 10
            dotView.layer.borderWidth = 1
            dotView.layer.borderColor = UIColor.white.cgColor
            dotView.translatesAutoresizingMaskIntoConstraints = false
            dotView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            dotView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            dotViews.append(dotView)
            dotsStackView.addArrangedSubview(dotView)
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.count > 4 {
            textField.text = String(text.prefix(4))
            pinCode = String(text.prefix(4))
        } else {
            pinCode = text
        }
        
        updateDots()
        
        if pinCode.count == 4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.pinEntered()
            }
        }
    }
    
    private func updateDots() {
        for (index, dotView) in dotViews.enumerated() {
            if index < pinCode.count {
                dotView.backgroundColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
                dotView.layer.borderColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0).cgColor
            } else {
                dotView.backgroundColor = .clear
                dotView.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
    
    private func pinEntered() {
        print("PIN создан: \(pinCode)")
        
        // Здесь можно:
        // 1. Сохранить PIN
        // 2. Попросить подтвердить PIN еще раз
        // 3. Перейти на следующий экран
        
        // Для демо - очищаем
        clearPin()
    }
    
    private func clearPin() {
        pinCode = ""
        hiddenTextField.text = ""
        updateDots()
    }
    
    private func setupBackground() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundView, at: 0)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupUI() {
        setupBackground()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        dotsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 77).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -77).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54).isActive = true
        
        dotsStackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 96).isActive = true
        dotsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotsStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

extension PinVerifyViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if string.isEmpty {
            return true
        }
        
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 4
    }
}
