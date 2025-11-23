//
//  LanguageViewController.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 23.11.25.
//

import UIKit

class Language: UIView {
    private let azerbaijanFlag: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "aze")
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.white.cgColor
        return img
    }()
    
    private let usaFlag: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "usa")
        return img
    }()
    
    private let russiaFlag: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "rus")
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.white.cgColor
        return img
    }()
    
//    private let circleView: UIView = {
//        let view = UIView()
//        return view
//    }()
//    
//    private let secCircleView:
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 236).isActive = true
        
        setupViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [azerbaijanFlag,usaFlag,russiaFlag].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupUI() {
        azerbaijanFlag.topAnchor.constraint(equalTo: topAnchor, constant: 34).isActive = true
        azerbaijanFlag.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 36).isActive = true
        azerbaijanFlag.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        usaFlag.topAnchor.constraint(equalTo: azerbaijanFlag.bottomAnchor, constant: 36).isActive = true
        usaFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36).isActive = true
        usaFlag.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        russiaFlag.topAnchor.constraint(equalTo: usaFlag.bottomAnchor, constant: 36).isActive = true
        russiaFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36).isActive = true
        russiaFlag.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}

//#Preview {
//    Language()
//}
