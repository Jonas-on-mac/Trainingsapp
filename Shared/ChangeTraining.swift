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
            
            ZStack{//START ZSTACK0
                VStack{
                //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{//Start VSTACK0
                    VStack{//START VSTACK1
                    Text("Trainingsplan")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        
                    }.padding(.top, -250.0)
                        VStack{//Start VSTACK2
                    
                            VStack{//START VSTACK UI
                            
                            
                          //ADD BUTTONS
                        HStack{//START HSTACK 1
                        
                        
                                    // Userinput feld
                                    TextField("Add Training...",text: $newtraining)
                                        .foregroundColor(.blue)
                                       .border(Color.blue)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)

                                        
                        
                                    TextField("Add Rep...",text: $newrepeat)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .foregroundColor(.blue)
                                        .border(Color.blue)
                                        .padding(.leading, 25.0)
                                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)

                            
                                    //funktion des plusbuttons
                                    Button(action:  {
                                        guard !self.newtraining.isEmpty else {return}
                                        self.alltraining.append(Training(train: self.newtraining, rep:self.newrepeat, count: self.Anzahl))
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
                        .background(Color.white)
            }.padding(.top, -200.0)//ENDE VSTACK UI
            
            
                            
                            VStack{//START VSTACK List
                            
                    
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
                            }.padding(.top, -150.0)//ENDE VSTACK Liste
                        }.background(Color.white)//Ende VSTACK 2
                }.background(Color.white)//Ende VSTACK0
                    
                    
                    
                    
        //TIMER ÄNDERN
                    VStack(spacing: -25.0){
            HStack{
                VStack(spacing: -30.0){
                    Text("Montag")
                    checkDay()
                }.frame(width: 75.0)
                VStack(spacing: -30.0){
                    Text("Dienstag")
                    checkDay()
                }.frame(width: 75.0)
                VStack(spacing: -30.0){
                    Text("Mittwoch")
                    checkDay()
                }.frame(width: 75.0)
                }
                    HStack{
                VStack(spacing: -30.0){
                    Text("Donnerstag")
                    checkDay()
                }.frame(width: 95.0)
                VStack(spacing: -30.0){
                    Text("Freitag")
                    checkDay()
                }.frame(width: 75.0)
                VStack(spacing: -30.0){
                    Text("Samstag")
                    checkDay()
                }
                .frame(width: 75.0)
                VStack(spacing: -30.0){
                    Text("Sonntag")
                    checkDay()
                }
            }
        }.border(Color.gray)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 400.0, height: 220.0)
                    
            }.background(Color.white)//ENDE ZSTACK0
                    
            }.background(Color.white)
            //Ende VSTACK1
        
        }.onAppear(perform: loadtraining)
        .background(Color.white)
        
        
            
            
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
