//
//  Quiz.swift
//  ToDos
//
//  Created by Scholar on 6/28/24.
//
//
//  Quiz.swift
//  quiziz
//
//  Created by Anna Khulup on 6/21/24.
//

import Foundation

class Quiz : ObservableObject{
    let questions = ["What type of weather would you prefer?", "What do you want to eat?", "What would you want to do?", "What setting would you prefer?", "What's your budget?", "Who are you going with?"]
    let answers = [["Hot", "Cold", "Warm", "Chilly"], ["Street Food" ,"Desserts", "Seafood", "Anything"], ["Sightseeing", "Swimming", "Skiing", "Shopping"], ["City", "Beach", "Mountains", "Countryside"], ["Budget", "Affordable", "High End", "Luxury"], ["Family", "Friends", "A partner", "Solo"]]
    let images = [["hot", "cold", "warm", "chilly"],["streetfood", "desserts", "seafood", "anything"],["sightseeing", "swimming", "skiing", "shopping"],["city", "beach", "mountain", "countryside"],["dollar", "twodollar", "threedollar", "fourdollar"],["family", "friends", "partner", "mountain"]]
    @Published var index = 0
    @Published var row = 0
    @Published var col = 0
    
    
    func asker () -> String
    {
        
        return questions[index]
    }
    
    
    
    
    func printer () -> Int
    {
        return index
    }
    
    
    func adder ()
    {
        if index < questions.count - 1 {
                    index += 1
                } else {
                    index = -1 // Reset to first question if at the end
                }
    }
    
    
    
    func quizzer ()
    {
        while true
        {
            if index < questions.count
            {
                print(asker())
            }
        }
    }
    
    
}
