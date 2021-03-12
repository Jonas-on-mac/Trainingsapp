//
//  ChangeTraining.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 04.03.21.
//

import SwiftUI
import UIKit
import Combine




struct ChangeTraining: View{
    
    static let instance = ChangeTraining()// Zugriff von anderen Klassen
    @State private var newtraining = ""
    @State private var alltraining: [Training] = []
    @State private var newrepeat = ""
    @State var Anzahl = 0 // variable im Hintergrund (anzahl aktiver Übungen)
    
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
                        .padding(.top, -100.0)
                    
                        VStack{//Start VSTACK2
                    
                            
                            
                            
                          //ADD BUTTONS
                        HStack{//START HSTACK 1
                        
                        
                        // Userinput feld
                        TextField("Add Training...",text: $newtraining)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Add Rep...",text: $newrepeat)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 25.0)
                            .foregroundColor(.pink)
                            .moveDisabled(true)
                        //funktion des plusbuttons
                        Button(action:  {
                            guard !self.newtraining.isEmpty else {return}
                            self.alltraining.append(Training(train: self.newtraining, rep: self.newrepeat, count: self.Anzahl))
                            
                            self.newrepeat = ""
                            self.newtraining = ""
                            self.anzahl()//Funktion
                            self.savetraining()//aufruf save func
                            
                        })  {
                            //dratsellung des pluss Buttons
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                            
                        }
                    }
                .padding() //ENDE HSTACK 1
                    
                            
                            
                            
                            
                    
                            //Liste die die übungen darstellt
                            // Liste für wiederholungen
                            List {
                                ForEach(alltraining) {Training in
                                    HStack{
                                        VStack{
                                            Text(Training.train)
                                        }
                                        .frame(width: 175.0)
                                        VStack{
                                            Text(Training.rep)
                                        }
                                        .frame(width: 175.0)
                                        
                                        
                                    }
                                    
                                   // Text("\(Anzahl)")
                                        
                                }.onDelete(perform: deletetraining)
                                // aufruf delete func
                        }
                    }
                }.background(Color.white)//Ende VSTACK2
                    
                    
                    
                    
                    //TIMER ÄNDERN
        VStack{
            HStack{
                VStack{
                    Text("Montag")
                    checkDay()
                }.frame(width: 50.0)
                VStack{
                    Text("Dienstag")
                    checkDay()
                }.frame(width: 50.0)
                VStack{
                    Text("Mittwoch")
                    checkDay()
                }.frame(width: 50.0)
                }
                    HStack{
                VStack{
                    Text("Donnerstag")
                    checkDay()
                }.frame(width: 50.0)
                VStack{
                    Text("Freitag")
                    checkDay()
                }.frame(width: 50.0)
                VStack{
                    Text("Samstag")
                    checkDay()
                }
                .frame(width: 50.0)
                VStack{
                    Text("Sonntag")
                    checkDay()
                }
            }
        }.padding(.bottom, -350.0).frame(width: 16.0)
                    

                    
                }//Ende VSTACK1
            }.onAppear(perform: loadtraining)
            
            
            
            //Beim aufruf der app werden die training geladen (aufruf der loadtraining funktion)
   
        
    }
    
    private func anzahl(){
       Anzahl=Anzahl+1
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
        Anzahl = Anzahl-1 // Hintergrund Variable (-1)
    }
}



struct Training: Codable, Identifiable {
    
    var id = UUID()
    
    let train: String
    
    let rep: String
    
    let count: Int
    
}



struct checkDay : View{
    @State var checkbox = false
    
    var body: some View{
        // Button setzt checkbox auf true oder false
        Button(action: {self.checkbox.toggle()})
        {
            //tru oder false steuert das Ändern des Images
            Image(systemName: checkbox ? "checkmark.square.fill" : "square")
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .imageScale(checkbox ? .large : .small)
                .foregroundColor(.black)
                .padding()
        }
        .animation(.easeInOut)
        .rotationEffect(checkbox ? Angle (degrees: 15) : .zero)
        
    }
}


//Vorschau
struct ChangeTraining_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTraining()
    }
}
