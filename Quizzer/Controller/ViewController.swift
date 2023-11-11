//
//  ViewController.swift
//  Quizzer
//
//  Created by macbook on 07.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var quizz = QuizzBrain()
    private let quizzerView = QuizzerView()

    override func viewDidLoad() {

        setupView()
        setupConstraints()
        addTargets()
        
        quizzerView.buttonTrue.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        quizzerView.buttonFalse.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        quizzerView.buttonThree.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)


    }
    
    private func setupView() {
        view.addSubviews(quizzerView)
        let questionNumber = quizz.questionNumber
        quizzerView.label.text = quizz.getQuestionText()
        quizzerView.buttonFalse.setTitle(quizz.titleForButton(0), for: .normal)
        quizzerView.buttonTrue.setTitle(quizz.titleForButton(1), for: .normal)
        quizzerView.buttonThree.setTitle(quizz.titleForButton(2), for: .normal)


        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            quizzerView.topAnchor.constraint(equalTo: view.topAnchor),
            quizzerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            quizzerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizzerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    
    private func addTargets() {
        quizzerView.buttonTrue.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        quizzerView.buttonFalse.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    
    @objc private func buttonTapped(_ sender: UIButton) {
    
        let userAnswer = sender.currentTitle
        let userGotItRight = quizz.checkAnswer(userAnswer!)
        
        sender.backgroundColor = userGotItRight ? .green : .red

        quizz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }

    @objc private func updateUI() {
        quizzerView.label.text = quizz.getQuestionText()
        quizzerView.scoreLabel.text = "Score: \(quizz.getScore())"
        quizzerView.buttonTrue.backgroundColor = .clear
        quizzerView.buttonFalse.backgroundColor = .clear
        quizzerView.buttonThree.backgroundColor = .clear
        quizzerView.progressBar.progress = quizz.getProgress()
        quizzerView.buttonFalse.setTitle(quizz.titleForButton(0), for: .normal)
        quizzerView.buttonTrue.setTitle(quizz.titleForButton(1), for: .normal)
        quizzerView.buttonThree.setTitle(quizz.titleForButton(2), for: .normal)
    }
    
}



//MARK: - SwiftUI
import SwiftUI
struct Provider_ViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return ViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_ViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) {
            
        }
    }
    
}
