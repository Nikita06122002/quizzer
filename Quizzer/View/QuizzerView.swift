//
//  QuizzerView.swift
//  Quizzer
//
//  Created by macbook on 09.11.2023.
//

import UIKit

class QuizzerView: UIView {
    
    init() {
        super.init(frame: .infinite)
        configView()
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let scoreLabel = UILabel()
    let label = UILabel()
    let buttonTrue = UIButton()
    let buttonFalse = UIButton()
    let buttonThree = UIButton()
    let progressBar = UIProgressView()
    
    private func configView() {
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25)
        
        buttonTrue.setTitle("True", for: .normal)
        buttonFalse.setTitle("False", for: .normal)
        buttonThree.setTitle("Three", for: .normal)
        buttonFalse.layer.borderWidth = 2
        buttonFalse.layer.cornerRadius = 10
        buttonTrue.layer.borderWidth = 2
        buttonTrue.layer.cornerRadius = 10
        buttonThree.layer.borderWidth = 2
        buttonThree.layer.cornerRadius = 10
        
        
        progressBar.progress = 0
        progressBar.progressTintColor = .purple
        progressBar.backgroundColor = .lightGray
        
        self.backgroundColor = .systemBlue
    }
    
    private func setupView() {
        self.addSubviews(scoreLabel, label, buttonTrue, buttonFalse, buttonThree, progressBar)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            scoreLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            
            label.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10),
            
            
            buttonFalse.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonFalse.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonFalse.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            buttonFalse.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            buttonFalse.widthAnchor.constraint(equalToConstant: 350),
            buttonFalse.heightAnchor.constraint(equalToConstant: 60),
            
            buttonTrue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonTrue.bottomAnchor.constraint(equalTo: buttonFalse.topAnchor, constant: -10),
            buttonTrue.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            buttonTrue.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            buttonTrue.widthAnchor.constraint(equalToConstant: 350),
            buttonTrue.heightAnchor.constraint(equalToConstant: 60),
            
            buttonThree.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonThree.bottomAnchor.constraint(equalTo: buttonTrue.topAnchor, constant: -10),
            buttonThree.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
            buttonThree.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            buttonThree.widthAnchor.constraint(equalToConstant: 350),
            buttonThree.heightAnchor.constraint(equalToConstant: 60),
            
            progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: buttonFalse.bottomAnchor, constant: 20),
            progressBar.leadingAnchor.constraint(equalTo: buttonFalse.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: buttonFalse.trailingAnchor),
            progressBar.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}
