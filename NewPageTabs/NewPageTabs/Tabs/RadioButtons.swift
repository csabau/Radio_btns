//
//  RadioButtons.swift
//  RabioButtons
//
//  Created by Caius Sabau on 02/04/2022.
//

import SwiftUI

// MARK: - Single Radio Button Field
struct RadioButtonField: View{
    let id: String
    let label: String
    let size: CGFloat
    let color: CGColor
    let stroke: CGColor
    let textSize: CGFloat
    let isMarked: Bool
    let callback: (String) -> ()
    
    let title: String
    
    init(
        id: String,
        label: String,
        size: CGFloat = 20,
        color: CGColor = #colorLiteral(red: 0.250980392156863, green: 0.250980392156863, blue: 0.250980392156863, alpha: 0.5),
        stroke: CGColor = #colorLiteral(red: 0.670588235294118, green: 0.898039215686275, blue: 0.12156862745098, alpha: 1),
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String) -> (),
        
        title: String
    ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.stroke = stroke
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
        
        self.title = title
    }
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("\(self.title)")
                    .font(.title3)
                    .foregroundColor(Color(self.stroke))
                    .fontWeight(.medium)
    //                .padding(.top, 20)
    //                .padding(.leading, 50)
                    
                    
                    .position(x: 0, y: 0)
            }.frame(width: self.isMarked ? UIScreen.main.bounds.width : 0, height : self.isMarked ? UIScreen.main.bounds.height : 0)
                //.offset(x: self.get, y: <#T##CGFloat#>)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                .background(Color.red)
                .opacity(0.5)
            
            
            Button(action: {
                self.callback(self.id)
            }) {
                    Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                        .resizable()
                        .foregroundColor(Color(self.stroke))
                        .background(Color(self.color))
                        .frame(width: 30, height: 30)
                        .cornerRadius(30)
               
            }
            
            
                
        }
            
    }
}


//MARK: - Group of Radio Buttons
enum Squat: String {
    case neck = "Neck"
    case core = "Core"
    case knee = "Knee"
    case back = "Back"
    case hip = "Hip"
    case foot = "Foot"
}

struct RadioButtonGroups: View{
    let callback: (String) -> ()
    
    @State var displayNeck: Bool = false
    
    @State var selectedId: String = ""
    
    var body: some View{ //the View and alignment of the buttons
        //Buttons
        VStack{
            VStack{ //Head
                Spacer()
                //Neck
                HStack{
                    radioNeck
//                    CircleButton(){
//                        print("Neck")
//                    }
                Spacer()
                }
                .frame(width: 100, height: 80)
            }
            
            HStack{
                //Spacer()
                HStack{ //Torso
                    Spacer()
                    VStack{
                        Spacer()
                        Spacer()
                        //Core
                        HStack{
                            Spacer()
                            radioCore
//                            CircleButton(){
//                                print("core")
//                            }
                        }
                        HStack{
                            radioKnee
//                            CircleButton(){
//                                print("knee")
//                            }
                            Spacer()
                        }
                    }
                }
                .frame(width: 100, height: 90)
                Spacer()
                VStack{
                    HStack{
                        //Back
                        radioBack
//                        CircleButton(){
//                            print("back")
//                        }
                        Spacer()
                    }
                    
                    HStack{
                        radioHip
//                        CircleButton(){
//                            print("hip")
//                        }
                    }
                    
                }
                .frame(width: 50)
                Spacer()
            }
            .frame(width: 200, height: 100)
                VStack{
                    radioFoot
//                    CircleButton(){
//                        print("")
//                    }
                    Spacer()
            }
            .frame(width: 150, height: 150)
            
        }
        .padding(.top, 80)//End of BUTTONS VStack
        
//        VStack {
//            radioNeck
//            radioCore
//            radioKnee
//            radioBack
//            radioHip
//            radioFoot
//        }
    }
    
    var radioNeck: some View {
        RadioButtonField(
            id: Squat.neck.rawValue,
            label: Squat.neck.rawValue,
            isMarked: selectedId == Squat.neck.rawValue ? true : false,
            callback: radioGroupCallback,
            title: "Neck test")
        
        //Text("Radio Next Test")
            
    }
    
    var radioCore: some View {
        RadioButtonField(
            id: Squat.core.rawValue,
            label: Squat.core.rawValue,
            isMarked: selectedId == Squat.core.rawValue ? true : false,
            callback: radioGroupCallback,
            title: "Core test")
    }
    var radioKnee: some View {
        RadioButtonField(
            id: Squat.knee.rawValue,
            label: Squat.knee.rawValue,
            isMarked: selectedId == Squat.knee.rawValue ? true : false,
            callback: radioGroupCallback,
            title: "Knee test")
    }
    var radioBack: some View {
        RadioButtonField(
            id: Squat.back.rawValue,
            label: Squat.back.rawValue,
            isMarked: selectedId == Squat.back.rawValue ? true : false,
            callback: radioGroupCallback,
            title: "Back test")
    }
    var radioHip: some View {
        RadioButtonField(
            id: Squat.hip.rawValue,
            label: Squat.hip.rawValue,
            isMarked: selectedId == Squat.hip.rawValue ? true : false,
            callback: radioGroupCallback,
            title: "Hip test")
    }
    
    var radioFoot: some View {
        RadioButtonField(
            id: Squat.foot.rawValue,
            label: Squat.foot.rawValue,
            isMarked: selectedId == Squat.foot.rawValue ? true : false,
            callback: radioGroupCallback,
            title: "Foot test")
    }
    
    
    func radioGroupCallback(id: String){
        selectedId = id
        callback(id)
    }
}


//struct TipsField: View{
//    
//    let id: String
//    let title: String
//    let content: String
//    let size: CGFloat
//    let color: CGColor
//    let stroke: CGColor
//    let textSize: CGFloat
//    let isMarked: Bool
//    
//    let callback: (String) -> ()
//    
//    init(
//        id: String,
//        title: String,
//        content: String,
//        size: CGFloat = 20,
//        color: CGColor = #colorLiteral(red: 0.250980392156863, green: 0.250980392156863, blue: 0.250980392156863, alpha: 0.5),
//        stroke: CGColor = #colorLiteral(red: 0.670588235294118, green: 0.898039215686275, blue: 0.12156862745098, alpha: 1),
//        textSize: CGFloat = 14,
//        isMarked: Bool = false,
//        
//        callback: @escaping (String) -> ()
//    ) {
//        self.id = id
//        self.title = title
//        self.content = content
//        self.size = size
//        self.color = color
//        self.stroke = stroke
//        self.textSize = textSize
//        self.isMarked = isMarked
//        
//        self.callback = callback
//        
//    }
//    
//    
//    var body: some View{
//        
//        VStack {
//            Text("\(self.title)")
//                .font(.title3)
//                .foregroundColor(Color(self.stroke))
//                .fontWeight(.medium)
//        }.frame(width: self.isMarked ? UIScreen.main.bounds.width : 0, height : self.isMarked ? UIScreen.main.bounds.height : 0)
//    }
//}
//
//
//
//struct TipsGroups: View{
//    
//    @State var selectedID: String = ""
//    
//    var body: some View{
//        tipsNeck
//    }
//    
//    
//    
//    
//    var tipsNeck: some View {
//        TipsField(
//            id: Squat.neck.rawValue,
//            title: Squat.neck.rawValue,
//            content: Squat.neck.rawValue,
//            isMarked: selectedId == Squat.neck.rawValue ? true : false,
//            callback: RadioButtonGroups.radioGroupCallback)
//    }
//}
