//
//  ChangeTraining.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 04.03.21.
//

import SwiftUI

struct ChangeTraining: View {
    @State private var steppervalue = 0
    
    
    var body: some View {
        
        
        ZStack {    //HINTERGRUND
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
          
            
            
           
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Stepper(value: $steppervalue, in: 0...15) {
                Text("Add\(steppervalue > 0 ? "Übung ": " ")")
                
                
            }
            
        }
    }
}

struct choosesport: View {
    var body: some View{
        
      Text("")
        
        
    }
}






//Vorschau
struct ChangeTraining_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTraining()
    }
}
