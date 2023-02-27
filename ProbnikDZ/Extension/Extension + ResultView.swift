//
//  Extension + ResultView.swift
//  ProbnikDZ
//
//  Created by Иван Худяков on 19.08.2022.
//

extension ResultViewController {
   func getResultAnimal() {
        var allAnimals = [AnimalType: Int]()
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
}
