//
//  MenuButtonGroup.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 22.11.25.
//

import UIKit

class MenuButtonGroup: UIView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        return stack
    }()
    
    private var tapHandlers: [Int: (() -> Void)] = [:]
    private var itemCount = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        clipsToBounds = true
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func addMenuItem(icon: UIImage?, title: String, subtitle: String? = nil, onTap: (() -> Void)? = nil) {
        if stackView.arrangedSubviews.count > 0 {
            let separatorContainer = UIView()
            separatorContainer.backgroundColor = .clear
                    
            let separator = UIView()
            separator.backgroundColor = UIColor(red: 55/255, green: 58/255, blue: 65/255, alpha: 1.0)
                    
            separatorContainer.addSubview(separator)
            separator.translatesAutoresizingMaskIntoConstraints = false
                    
            NSLayoutConstraint.activate([
                separatorContainer.heightAnchor.constraint(equalToConstant: 1),
                separator.leadingAnchor.constraint(equalTo: separatorContainer.leadingAnchor, constant: 16),
                separator.trailingAnchor.constraint(equalTo: separatorContainer.trailingAnchor, constant: -16),
                separator.topAnchor.constraint(equalTo: separatorContainer.topAnchor),
                separator.bottomAnchor.constraint(equalTo: separatorContainer.bottomAnchor)
            ])
                    
            stackView.addArrangedSubview(separatorContainer)
        }
        
        let itemView = UIView()
        itemView.backgroundColor = .clear
        itemView.tag = itemCount
        itemView.isUserInteractionEnabled = true
        itemView.translatesAutoresizingMaskIntoConstraints = false 
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(itemTapped(_:)))
        itemView.addGestureRecognizer(tap)
        
        if let handler = onTap {
            tapHandlers[itemCount] = handler
        }
        itemCount += 1
        
        let iconImageView = UIImageView()
        iconImageView.image = icon
        iconImageView.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textColor = .white
        
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "right")
        arrowImageView.contentMode = .scaleAspectFit
        
        itemView.addSubview(iconImageView)
        itemView.addSubview(titleLabel)
        itemView.addSubview(arrowImageView)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemView.heightAnchor.constraint(equalToConstant: 48),
            
            iconImageView.leadingAnchor.constraint(equalTo: itemView.leadingAnchor, constant: 12),
            iconImageView.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        if let subtitle = subtitle {
            let subtitleLabel = UILabel()
            subtitleLabel.text = subtitle
            subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
            subtitleLabel.textColor = UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0)
            
            itemView.addSubview(subtitleLabel)
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                subtitleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8),
                subtitleLabel.centerYAnchor.constraint(equalTo: itemView.centerYAnchor)
            ])
        }
        
        stackView.addArrangedSubview(itemView)
    }
    
    @objc private func itemTapped(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        UIView.animate(withDuration: 0.1, animations: {
            view.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                view.alpha = 1.0
            }
        }
        
        tapHandlers[view.tag]?()
    }
}

