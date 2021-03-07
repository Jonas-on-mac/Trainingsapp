//
//  ChangeTraining.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 04.03.21.
//

import SwiftUI
import UIKit





struct ChangeTraining: View{
    
    @State private var newtraining = ""
    @State private var alltraining: [Training] = []
    @State private var newrepeat = ""
    
    
    var body: some View{
        
        NavigationView{
            
            ZStack{
                
                //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{
                    
                    Text("Trainingsplan")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                       
                    
                    HStack{
                        
                        
                        // Userinput feld
                        TextField("Add Training...",text: $newtraining)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Add Rep...",text: $newrepeat)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 25.0)
                        //funktion des plusbuttons
                        Button(action:  {
                            guard !self.newtraining.isEmpty else {return}
                            self.alltraining.append(Training(train: self.newtraining, rep: self.newrepeat))
                             
                            self.newrepeat = ""
                            self.newtraining = ""
                            self.savetraining()
                            
                        })  {
                            //dratsellung des pluss Buttons
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                            
                        }
                        
                        
                        
                    }.padding()
                    
                    //Liste die die übungen darstellt
                    ZStack{
                        HStack{
                            List {
                                ForEach(alltraining) {Training in
                                    Text(Training.train)
                                    
                                }
                                
                            }
                            
                            // Liste für wiederholungen
                            List {
                                ForEach(alltraining) {Training in
                                    Text(Training.rep)
                                    
                                }.onDelete(perform: deletetraining)
                                
                                
                            }
                           
                            
                        }
                    }
                    
                }
            }
          
            
            
        //Beim aufruf der app werden die training geladen (aufruf der loadtraining funktion)
        }.onAppear(perform: loadtraining)
    }
    
    
    private func savetraining() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alltraining), forKey: "trainingKey")
    }
    
    
    private func loadtraining() {
        if let trainingData = UserDefaults.standard.value(forKey: "trainingKey") as? Data {
            if let trainingList = try? PropertyListDecoder().decode(Array<Training>.self, from: trainingData) {
                self.alltraining = trainingList
            }
        }
    }
    
    private func deletetraining(at offsets: IndexSet) {
        self.alltraining.remove(atOffsets: offsets)
        savetraining()
    }
}

struct Training: Codable, Identifiable {
    
    var id = UUID()
    
    let train: String
    
    let rep: String
        
}



//Vorschau
struct ChangeTraining_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTraining()
    }
}
