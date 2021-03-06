//
//  ChangeTraining.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 04.03.21.
//

import SwiftUI






struct ChangeTraining: View{
    
    @State private var newtraining = ""
    @State private var alltraining: [Training] = []

    
    
    var body: some View{
        
        NavigationView{
            ZStack{
                //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{
                    HStack{
                        // Userinput feld
                        TextField("Add Training...",text: $newtraining)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        //funktion des plusbuttons
                        Button(action:  {
                            guard !self.newtraining.isEmpty else {return}
                            self.alltraining.append(Training(train: self.newtraining))
                            self.newtraining = ""
                            self.savetraining()
                            
                        })  {
                            //dratsellung des pluss Buttons
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                            
                        }
                        
                        
                        
                    }.padding()
                    
                    //Liste die die übungen darstellt
                    List {
                        ForEach(alltraining) {Training in
                            Text(Training.train)
                            
                        }.onDelete(perform: deletetraining)
                        
                    }
                    
                }
            }
            //Titel
            .navigationBarTitle("Übungen")
            
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
        
}



//Vorschau
struct ChangeTraining_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTraining()
    }
}
