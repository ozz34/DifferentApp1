//
//  Extension + ResultView.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 19.08.2022.
//


extension ResultViewController {
    
    func getResultAnimal() {
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        answerChosen.forEach {
            switch $0.type {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .turtle:
                turtle += 1
            }
        }
        
        let animals = ["dog" : dog,
                       "cat" : cat,
                       "rabbit" : rabbit,
                       "turtle" : turtle]
        
        let needAnimal = animals.sorted {$0.value > $1.value}.first?.key
        
        if needAnimal == "dog" {
            resultAnimalLabel.text = "Вы  - \(String(AnimalType.dog.rawValue))"
            resultDescriptionLabel.text = AnimalType.dog.definition
        } else if needAnimal == "cat" {
            resultAnimalLabel.text = "Вы  - \(String(AnimalType.cat.rawValue))"
            resultDescriptionLabel.text = AnimalType.cat.definition
        } else if needAnimal == "turtle" {
            resultAnimalLabel.text = "Вы  - \(String(AnimalType.turtle.rawValue))"
            resultDescriptionLabel.text = AnimalType.turtle.definition
        } else {
            resultAnimalLabel.text = "Вы  - \(String(AnimalType.rabbit.rawValue))"
            resultDescriptionLabel.text = AnimalType.rabbit.definition
        }
    }
}
