//  Operators Challenge
//
//  Created by Smooth Operator
//  Copyright © 2023 MobileMakersEdu. All rights reserved.


import SwiftUI

struct ContentView: View {
    @State var number1 = ""
    @State var number2 = ""
    @State var currentOperator = "=="
    @State var answer = "?????"
    @State var showError: Bool = false
    
    @State private var numberOfTicketsTextFieldText = ""
    @State private var purchasedPackages = 0
    @State private var individualTickets = 0
    
    @State private var urlAddOn = ""
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Group {
                Divider()
                Text("Operators Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.largeTitle)
                Divider()
            }
            HStack {
                
                Group {
                    TextField("#", text: $number1)
                    TextField("\(currentOperator)", text: $currentOperator)
                    TextField("#", text: $number2)
                }
                .frame(width:40)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                
                Text("evaluates as")
                Text("\(answer)")
                
            }
            
            Button("Test MVP") {
                
                if number1 != "" && number2 != "" {
                    guard let number1 = Int(number1) else {return}
                    guard let number2 = Int(number2) else {return}
                    
                    //MARK: MVP
                    
                    let equalTo = number1 == number2
                    let notEqualTo = number1 != number2
                    let greaterThan = number1 > number2
                    let lessThan = number1 < number2
                    let greaterThanOrEqualTo = number1 >= number2
                    let lessThanOrEqualTo = number1 <= number2




                    
                    
                    //TODO: MVP - Uncomment below
                    if currentOperator == "==" {
                        answer = "\(equalTo)"
                    } else if currentOperator == "!=" {
                        answer = "\(notEqualTo)"
                    } else if currentOperator == ">" {
                        answer = "\(greaterThan)"
                    } else if currentOperator == "<" {
                        answer = "\(lessThan)"
                    } else if currentOperator == "<=" {
                        answer = "\(lessThanOrEqualTo)"
                    } else if currentOperator == ">=" {
                        answer = "\(greaterThanOrEqualTo)"
                    } else {
                        showError = true
                    }
                }
            }
            .frame(width: 80, height: 30, alignment: .center)
            .background(.blue)
            .foregroundColor(.white)
            .alert("Not A Comparison Operator", isPresented: $showError){}
            Divider()
            Group {
                HStack {
                    TextField("Number of tickets", text: $numberOfTicketsTextFieldText)
                        .border(Color.blue)
                        .fixedSize()
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    VStack(alignment: .leading) {
                        Text("Buy \(purchasedPackages) packages")
                        Text("Buy \(individualTickets) single ticket(s)")
                    }
                }
                Button("Test Stretch #1") {
                    testStretch1()
                }
                .frame(width: 120, height: 30, alignment: .center)
                .background(.blue)
                .foregroundColor(.white)
            }
            
            Group {
                Divider()
                Spacer()
                Text("Swipe Left and Right Here")
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("For Stretch #2")
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                Divider()
            }.gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                .onEnded({ value in
                    if value.translation.width < 0 {
                        swipeLeft()
                    }
                    if value.translation.width > 0 {
                        swipeRight()
                    }
                }))
            TextField("urlAddOn", text: $urlAddOn)
                .border(Color.blue)
                .fixedSize()
                .keyboardType(.URL)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            Button("Test Stretch #3") {
                testStretch3()
            }
            .frame(width: 120, height: 30, alignment: .center)
            .background(.blue)
            .foregroundColor(.white)
            
            Group {
                Spacer()
                Image("MobileMakersEdu")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
            }
            
        }
        .padding()
        
    }
    
    
    func testStretch1() {
        if let numberOfTickets = Int(numberOfTicketsTextFieldText) {
            
            //MARK: Stretch #1
            
            purchasedPackages = numberOfTickets / 4
            individualTickets = numberOfTickets % 4
            
            
            
        }
    }
    
    func swipeRight() {
        if var numberOfTickets = Int(numberOfTicketsTextFieldText) {

            //MARK: Stretch #2 - Right
            numberOfTickets += 1
            
            numberOfTicketsTextFieldText = String(numberOfTickets)
            
        }
    }
    
    func swipeLeft() {
        if var numberOfTickets = Int(numberOfTicketsTextFieldText) {
            
            //MARK: Stretch #2 - Left
            numberOfTickets -= 1
            
            
            numberOfTicketsTextFieldText = String(numberOfTickets)
        }
    }
    
    func testStretch3() {
        //MARK: Stretch #3
        
        let unchartedURL = "https://www.unchartedlearning.org/"
        let completeURL = "\(unchartedURL)\(urlAddOn)"
        
        
        
        
      // TODO: Stretch #3 - Uncomment below
       openURL(URL(string: completeURL)!)
    }
    
}

