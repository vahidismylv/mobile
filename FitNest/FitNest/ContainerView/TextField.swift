//
//  CustomTextField.swift
//  FitNest
//

import UIKit

class TextField: UIView {
    
    private let iconContainerView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0)
         view.layer.cornerRadius = 22
         return view
     }()
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = .systemFont(ofSize: 16)
        return tf
    }()
    
    private lazy var toggleSecureButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        btn.tintColor = UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(toggleSecureEntry), for: .touchUpInside)
        return btn
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 12/255, green: 14/255, blue: 18/255, alpha: 1)
        view.layer.cornerRadius = 26
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0).cgColor
        return view
    }()
    
    private var isSecureField: Bool = false
    private var placeholderText: String = ""
    
    init(icon: UIImage?, placeholder: String, isSecure: Bool = false) {
        super.init(frame: .zero)
        
        iconImageView.image = icon
        textField.isSecureTextEntry = isSecure
        self.isSecureField = isSecure
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
            .foregroundColor: UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0),
            .font: UIFont.systemFont(ofSize: 16)
            ]
        )
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @objc private func toggleSecureEntry() {
        textField.isSecureTextEntry.toggle()
        
        let imageName = textField.isSecureTextEntry ? "eye.slash" : "eye"
        toggleSecureButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    private func setupUI() {
            addSubview(containerView)
            containerView.addSubview(iconContainerView)
            iconContainerView.addSubview(iconImageView)
            containerView.addSubview(textField)
            
            if isSecureField {
                containerView.addSubview(toggleSecureButton)
            }
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            iconContainerView.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            var constraints = [
                containerView.topAnchor.constraint(equalTo: topAnchor),
                containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                containerView.heightAnchor.constraint(equalToConstant: 56),
                
                iconContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6),
                iconContainerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                iconContainerView.widthAnchor.constraint(equalToConstant: 44),
                iconContainerView.heightAnchor.constraint(equalToConstant: 44),
                
                iconImageView.centerXAnchor.constraint(equalTo: iconContainerView.centerXAnchor),
                iconImageView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 22),
                iconImageView.heightAnchor.constraint(equalToConstant: 22),
                
                
                textField.leadingAnchor.constraint(equalTo: iconContainerView.trailingAnchor, constant: 12),
                textField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ]
            
            if isSecureField {
            toggleSecureButton.translatesAutoresizingMaskIntoConstraints = false
                
            constraints.append(contentsOf: [
            toggleSecureButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            toggleSecureButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            toggleSecureButton.widthAnchor.constraint(equalToConstant: 20),
            toggleSecureButton.heightAnchor.constraint(equalToConstant: 20),
                
            textField.trailingAnchor.constraint(equalTo: toggleSecureButton.leadingAnchor, constant: -12)
            ])
        } else {
            constraints.append(
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
            )
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension TextField {
    func setErrorState() {
        containerView.layer.borderColor = UIColor(red: 247/255, green: 110/255, blue: 113/255, alpha: 1.0).cgColor
            containerView.layer.borderWidth = 1
        }
    
    func setNormalState() {
        containerView.layer.borderColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0).cgColor
    }
  
}
