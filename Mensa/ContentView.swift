//
//  ContentView.swift
//  Mensa
//
//  Created by Prof. Dr. Nunkesser, Robin on 06.01.22.
//

import SwiftUI
import MockMealAdapters
import MealPorts

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                Task(priority: .medium) {
                    do {
                        try success(meals: await MockGetMealsCommand().execute(inDTO: MealQueryDTO(mensa: 1, date: Date())))
                    } catch let error {
                        failure(error: error)
                    }
                }
            }
    }
    
    func success(meals: [MealCollection]) {
        debugPrint(meals)
    }
    
    func failure(error: Error) {
        debugPrint(error.localizedDescription)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
