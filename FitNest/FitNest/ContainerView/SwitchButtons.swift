//
//  SwitchButtons.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 25.10.25.
//

import UIKit

class SwitchButtons: UIView {
    
    var onSwitchChanged: ((String) -> Void)?
    
    private let emailButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Email", for: .normal)
        btn.setTitleColor(UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return btn
    }()
    
    private let phoneButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Mobil nömrə", for: .normal)
        btn.setTitleColor(UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return btn
    }()
    
    private let containerView: UIView = {
        let cont = UIView()
        cont.backgroundColor = .clear
        return cont
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
        selectDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(containerView)
        containerView.addSubview(emailButton)
        containerView.addSubview(phoneButton)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 4).isActive = true
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.leadingAnchor.constraint(equalTo: emailButton.trailingAnchor,constant: 16).isActive = true
        
        emailButton.addTarget(self, action: #selector(handleEmailTap), for: .touchUpInside)
        phoneButton.addTarget(self, action: #selector(handlePhoneTap), for: .touchUpInside)
    }
    
    @objc private func handleEmailTap() {
          updateSelection(selectedButton: emailButton)
          onSwitchChanged?("email")
      }

      @objc private func handlePhoneTap() {
          updateSelection(selectedButton: phoneButton)
          onSwitchChanged?("phone")
      }

      private func updateSelection(selectedButton: UIButton) {
          let buttons = [emailButton, phoneButton]
          
          for button in buttons {
              if button == selectedButton {
                  let attributedTitle = NSAttributedString(
                      string: button.currentTitle ?? "",
                      attributes: [
                        .foregroundColor: UIColor(red: 0/255, green: 180/255, blue: 204/255, alpha: 1.0),
                        .underlineStyle: NSUnderlineStyle.single.rawValue
                      ]
                  )
                  button.setAttributedTitle(attributedTitle, for: .normal)
              } else {
                  let attributedTitle = NSAttributedString(
                      string: button.currentTitle ?? "",
                      attributes: [
                          .foregroundColor: UIColor(red: 145/255, green: 145/255, blue: 153/255, alpha: 1.0),
                          .underlineStyle: 0
                      ]
                  )
                  button.setAttributedTitle(attributedTitle, for: .normal)
              }
          }
      }
    
    func selectDefault() {
        updateSelection(selectedButton: emailButton)
    }
    
    
    
    
    
}
