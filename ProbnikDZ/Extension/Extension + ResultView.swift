//
//  Extension + ResultView.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 19.08.2022.
//


extension ResultViewController {
    
   func getResultAnimal() {
        
        var allAnimals = [AnimalType : Int]()
        let animals = answerChosen.map { $0.type }
        
       for animal in animals {
           if let myAnimal = allAnimals[animal] {
               allAnimals.updateValue(myAnimal + 1, forKey: animal)
           } else {
               allAnimals[animal] = 1
           }
       }
       
//       или
//       for animal in animals {
//           allAnimals[animal] = (allAnimals[animal] ?? 0) + 1
//       }
//       или
//
//       for animal in animals {
//           allAnimals[animal, default: 0] += 1
//       }
       
       let sortedALLAnimals = allAnimals.sorted { $0.value > $1.value}
       guard let finalAnimal = sortedALLAnimals.first?.key else { return }
       
       printAnimal(with: finalAnimal)
            
   }
    
    private func printAnimal(with animal: AnimalType) {
        resultAnimalLabel.text = "Вы  - \(animal.rawValue)"
        resultDescriptionLabel.text = animal.definition
    }
    
    
//        var dog = 0
//        var cat = 0
//        var rabbit = 0
//        var turtle = 0
        
//        answerChosen.forEach {
//            switch $0.type {
//            case .dog:
//                dog += 1
//            case .cat:
//                cat += 1
//            case .rabbit:
//                rabbit += 1
//            case .turtle:
//                turtle += 1
//            }
    
        
//        let animals = ["dog" : dog,
//                       "cat" : cat,
//                       "rabbit" : rabbit,
//                       "turtle" : turtle]
        
//        
//
//        if needAnimal == "dog" {
//            resultAnimalLabel.text = "Вы  - \(String(AnimalType.dog.rawValue))"
//            resultDescriptionLabel.text = AnimalType.dog.definition
//        } else if needAnimal == "cat" {
//            resultAnimalLabel.text = "Вы  - \(String(AnimalType.cat.rawValue))"
//            resultDescriptionLabel.text = AnimalType.cat.definition
//        } else if needAnimal == "turtle" {
//            resultAnimalLabel.text = "Вы  - \(String(AnimalType.turtle.rawValue))"
//            resultDescriptionLabel.text = AnimalType.turtle.definition
//        } else {
//            resultAnimalLabel.text = "Вы  - \(String(AnimalType.rabbit.rawValue))"
//            resultDescriptionLabel.text = AnimalType.rabbit.definition
//        }
//    }
}
