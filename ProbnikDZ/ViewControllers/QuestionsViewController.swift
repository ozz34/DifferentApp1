//
//  ViewController.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 01.08.2022.
//

import UIKit

final class QuestionsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rengedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    @IBOutlet var questionsProgressView: UIProgressView!
    
    // MARK: - Private properties
    private let questions = Question.getQuestions()
    private var answerChosen: [Answer] = []
    private var currentQuestionIndex = 0 // index current questions
   
    private var currentAnswers: [Answer] {
        questions[currentQuestionIndex].answers
    }
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let result = segue.destination as? ResultViewController else { return }
        result.answerChosen = answerChosen
        
    }

    // MARK: - IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rengedAnswerButtonPressed() {
        let index = lrint(Double(rangedSlider.value))
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
}

// MARK: - User Interface
extension QuestionsViewController {
    private func updateUI() {
        // hide stack
        for stackView in [singleStackView, multipleStackView, rengedStackView] {
            stackView?.isHidden = true
        }
        // set current question
        let currentQuestion = questions[currentQuestionIndex]
        // set current qustion for label
        questionLabel.text = currentQuestion.title
        // set progress
        let totalProgress = Float(currentQuestionIndex)/Float(questions.count)
        questionsProgressView.setProgress(totalProgress, animated: true)
        // set navigation title
        title = "Вопрос № \(currentQuestionIndex + 1) из \(questions.count)"
    
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rengedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
}
   
    private func nextQuestion() {
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            updateUI()
            return
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
}
