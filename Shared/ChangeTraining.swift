//
//  ChangeTraining.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 04.03.21.
//

import SwiftUI

struct ChangeTraining: View {
    
    @State var name: String = ""
    
    var body: some View {
        
        
        ZStack {    //HINTERGRUND
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
          
            VStack{
            
                Text("Übungen")
                TextField("name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                
                }.padding()
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
