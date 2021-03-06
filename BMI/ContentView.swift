//
//  ContentView.swift
//  BMI
//
//  Created by Sittinon Phiwkliang on 31/3/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var result:String = "BMI Calculator"
    @State var weight:String = ""
    @State var height:String = ""
    @State var notice:String = ""
    
    var body: some View {
        VStack {
            
            if (notice == "ต่ำกว่าเกณฑ์") {
                Text(notice)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.yellow)
            }else if (notice == "สูงกว่าเกณฑ์") {
                Text(notice)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.yellow)
            }else if (notice == "มาตรฐาน") {
                Text(notice)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.green)
            }else {
                Text(notice)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.red)
            }
            
            VStack {
                
                if (notice == "ต่ำกว่าเกณฑ์") {
                    Text(result)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.yellow)
                }else if (notice == "สูงกว่าเกณฑ์") {
                    Text(result)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.yellow)
                }else if (notice == "มาตรฐาน") {
                    Text(result)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.green)
                }else {
                    Text(result)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                
                HStack {
                    Text("น้ำหนัก")
                    TextField("กก.", text: $weight).keyboardType(.numberPad)
                }.padding()
                
                HStack {
                    Text("ส่วนสูง")
                    TextField("ซม.", text: $height).keyboardType(.numberPad)
                }.padding()
                
                Button(action: {
                    if weight.isEmpty || height.isEmpty {
                        self.weight = "0"
                        self.height = "0"
                    }
                    let resultcal = Double(self.weight)! / pow(Double(self.height)! / 100.0, 2)
                    self.result = String(resultcal)
                    
                    if (resultcal <= 18.5 && resultcal > 0) {
                        self.notice = "ต่ำกว่าเกณฑ์"
                    }else if (resultcal >= 25) {
                        self.notice = "สูงกว่าเกณฑ์"
                    }else if (resultcal > 18.5 && resultcal < 25){
                        self.notice = "มาตรฐาน"
                    }else {
                        self.notice = "Error"
                    }
                    
                    
                }) {
                    Text("คำนวณ")
                }.padding()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .statusBar(hidden: false)
        
    }
}
