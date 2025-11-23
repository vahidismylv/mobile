////
////  Button.swift
////  FitNest
////
////  Created by Vahid Ismayilov on 19.11.25.
//
import UIKit

class MenuButton: UIView {
    
    var onTap: (() -> Void)?
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0)
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "right")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    init(icon: UIImage?, title: String, subtitle: String? = nil,arrow: UIImage? = nil) {
        super.init(frame: .zero)
        
        iconImageView.image = icon
        titleLabel.text = title
        subtitleLabel.text = subtitle
        arrowImageView.image = arrow
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 12/255, green: 14/255, blue: 18/255, alpha: 1.0)
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0).cgColor
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(arrowImageView)
        
        if subtitleLabel.text != nil {
            addSubview(subtitleLabel)
        }
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 56),
            
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        if subtitleLabel.text != nil {
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                subtitleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8),
                subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        // Анимация нажатия
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.alpha = 1.0
            }
        }
           
        onTap?()
    }
    
}


