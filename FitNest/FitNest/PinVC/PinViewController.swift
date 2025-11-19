//
//  PinViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 02.11.25.
//

import UIKit

class PinViewController: UIViewController {
    
    private let backgroundView = BackgroundView()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Xoş gəlmisiniz"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Leyla Abdullayeva"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let dotsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 32
        return stack
    }()
    
    private let errorLabel: UILabel = {
        let txt = UILabel()
        txt.text = "Yanlış pin, yenidən cəhd edin"
        txt.textColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0)
        txt.font = .systemFont(ofSize: 13, weight: .semibold)
        txt.textAlignment = .center
        txt.isHidden = true
        return txt
    }()
    
    private var dotViews: [UIView] = []
    private var pinCode: String = ""
    
    private let numberPadStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    private let biometricButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "faceid"), for: .normal)
        btn.tintColor = UIColor(red: 0/255, green: 205/255, blue: 232/255, alpha: 1.0)
        btn.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return btn
    }()
    
    private let loginTextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Daxil ola\nbilmirəm", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.titleLabel?.numberOfLines = 2
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(cantLogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupDots()
        setupNumberPad()
    }
    
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(welcomeLabel)
        view.addSubview(nameLabel)
        view.addSubview(dotsStackView)
        view.addSubview(errorLabel)
        view.addSubview(numberPadStackView)
    }
    
    private func setupDots() {
        for _ in 0..<4 {
            let dotView = UIView()
            dotView.backgroundColor = .clear
            dotView.layer.cornerRadius = 12
            dotView.layer.borderWidth = 1
            dotView.layer.borderColor = UIColor.white.cgColor
//            dotView.layer.borderColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0).cgColor
            dotView.translatesAutoresizingMaskIntoConstraints = false
            dotView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            dotView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            dotViews.append(dotView)
            dotsStackView.addArrangedSubview(dotView)
            errorLabel.isHidden = true
        }
    }
    
    private func setupNumberPad() {
        let rows = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        
        for row in rows {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.distribution = .fillEqually
            rowStack.spacing = 40
            
            for number in row {
                let button = createNumberButton(number: number)
                rowStack.addArrangedSubview(button)
            }
            
            numberPadStackView.addArrangedSubview(rowStack)
        }
        
        let lastRowStack = UIStackView()
        lastRowStack.axis = .horizontal
        lastRowStack.distribution = .fillEqually
        lastRowStack.spacing = 40
        
        lastRowStack.addArrangedSubview(loginTextButton)
        
        let zeroButton = createNumberButton(number: 0)
        lastRowStack.addArrangedSubview(zeroButton)
        
        lastRowStack.addArrangedSubview(biometricButton)
        
        numberPadStackView.addArrangedSubview(lastRowStack)
    }
    
    private func createNumberButton(number: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("\(number)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.tag = number
        button.addTarget(self, action: #selector(numberButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func numberButtonTapped(_ sender: UIButton) {
        guard pinCode.count < 4 else { return }
        
        let number = sender.tag
        pinCode += "\(number)"
        
        updateDots()
        
        if pinCode.count == 4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.verifyPin()
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
    
    private func verifyPin() {
        print("PIN введен: \(pinCode)")
        
        
        clearPin()
    }
    
    private func clearPin() {
        pinCode = ""
        updateDots()
    }
    
    @objc private func cantLogin() {
        let nextVC = CantLoginViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dotsStackView.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        numberPadStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 186),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dotsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 92),
            dotsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dotsStackView.heightAnchor.constraint(equalToConstant: 24),
            
            errorLabel.topAnchor.constraint(equalTo: dotsStackView.bottomAnchor, constant: 20),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 99.5),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -99.5),
            
            numberPadStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            numberPadStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            numberPadStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -46),
            numberPadStackView.heightAnchor.constraint(equalToConstant: 320)
            
            

        ])
    }
}

//#Preview{
//    PinViewController()
//}
