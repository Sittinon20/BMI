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
                    .foregroundColor(.red)
            }else {
                Text(notice)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.green)
            }
            
            VStack {
                
                if (notice == "ต่ำกว่าเกณฑ์") {
                    Text(result)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.yellow)
                }else if (notice == "สูงกว่าเกณฑ์") {
                    Text(result)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.red)
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
                    let resultcal = Double(self.weight)! / pow(Double(self.height)! / 100.0, 2)
                    self.result = String(resultcal)
                    
                    if (resultcal <= 18.5) {
                        self.notice = "ต่ำกว่าเกณฑ์"
                    }else if (resultcal >= 25) {
                        self.notice = "สูงกว่าเกณฑ์"
                    }else {
                        self.notice = "มาตรฐาน"
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
    }
}
