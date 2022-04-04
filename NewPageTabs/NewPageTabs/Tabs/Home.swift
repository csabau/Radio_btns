//
//  Home.swift
//  PagerTabs
//
//  Created by Caius Sabau on 31/03/2022.
//

import SwiftUI



struct Home: View {
    
    @State var displayNeck: Bool = true
    
    //@Binding var isHidden: Bool
    let stroke: CGColor = #colorLiteral(red: 0.670588235294118, green: 0.898039215686275, blue: 0.12156862745098, alpha: 1)
    
    //Current tab
    @State var currentSelection : Int = 0
    var body: some View {
        PagerTabView(tint: /*isHidden ? */.white /* : .clear */, tint2: /*isHidden ? */.green /* : .clear*/, selection: $currentSelection){
            
            Text("AR") //Image(systemName: "house.fill")
                .pageLabel()
            
            Text("Tips") //Image(systemName: "magnifyingglass")
                .pageLabel()
            
            Text("Demo") //Image(systemName: "person.fill")
                .pageLabel()
            
        } content: {
            
            //Page 1
//            ZStack{
//                BlurView(style: .dark)
//                    .newPageView(ignoresSafeArea: true, edges: .top)
////                Color.red
////                    .firstPageView() //this essentially fills in the screen all teh way under the home bar - compare to he oher two screends
//                Button(action: {
////                        backBtnIsVisible.toggle()
//                    //RecordBtn()
//                    //self.isHidden = false
//                   // print("vaue is \(isHidden)")
//                    //recordUI(isHidden: isHidden)
//                }) {
//                    Text("Tap me to begin")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                        .frame(width: 200, height: /* isHidden ? */100 /*: 0*/)
//                }
//
//            }
                
            //Page 2
            ZStack{
                
                BlurView(style: .dark)
                    .newPageView(ignoresSafeArea: true, edges: .top)
//
                VStack{
                    //1. Stacking the image and the buttons
                    ZStack{
                        //backround image
                        Image("squat")
                            .resizable()
                            .scaledToFit()
                        
                        RadioButtonGroups { selected in
                            
                            TipsContent(key: selected)
                            
//                            if selected == "Neck" {
//                                displayNeck.toggle()
//                            }
//                            Text("\( (tips[selected]?["title"])! )")
                            print("You selected: \(displayNeck)")
                           // print("display value: \(self.displayTip)")
                        }
//                        //Buttons
//                        VStack{
//                            VStack{ //Head
//                                Spacer()
//                                //Neck
//                                HStack{
//                                    CircleButton(){
//                                        print("Neck")
//                                    }
//                                Spacer()
//                                }
//                                .frame(width: 100, height: 80)
//                            }
//                            
//                            HStack{
//                                //Spacer()
//                                HStack{ //Torso
//                                    Spacer()
//                                    VStack{
//                                        Spacer()
//                                        Spacer()
//                                        //Core
//                                        HStack{
//                                            Spacer()
//                                            CircleButton(){
//                                                print("core")
//                                            }
//                                        }
//                                        HStack{
//                                            CircleButton(){
//                                                print("knee")
//                                            }
//                                            Spacer()
//                                        }
//                                    }
//                                }
//                                .frame(width: 100, height: 90)
//                                Spacer()
//                                VStack{
//                                    HStack{
//                                        //Back
//                                        CircleButton(){
//                                            print("back")
//                                        }
//                                        Spacer()
//                                    }
//                                    
//                                    HStack{
//                                        CircleButton(){
//                                            print("hip")
//                                        }
//                                    }
//                                    
//                                }
//                                .frame(width: 50)
//                                Spacer()
//                            }
//                            .frame(width: 200, height: 100)
//                                VStack{
//                                    CircleButton(){
//                                        print("")
//                                    }
//                                    Spacer()
//                            }
//                            .frame(width: 150, height: 150)
//                            
//                        }
//                        .padding(.top, 80)//End of BUTTONS VStack
                    }
                    //End of Image and Buttons ZStack
                    .frame(width: UIScreen.main.bounds.width - 20)
                    Spacer()
                    
                    //2.Tips words:
                    ZStack{
                        //Base for writing
                        Rectangle()
                            //.frame(height: 300)
                        
                        ZStack{ //Tips writing
                            
                                VStack(alignment: .leading){ //Neck text
                                        Text("Neck")
                                            .font(.title3)
                                            .foregroundColor(Color(stroke))
                                            .fontWeight(.medium)
                                        
                                            //.frame(height: 50)
                                            .padding(.top, 20)
                                            .padding(.leading, 50)
                                            
                                    
                                    ScrollView{
                                        Text("But who has any  of the great explorer of the truth, the master-builder of human happiness.  ")
                                    }
                                    .frame(height: displayNeck ? 250 : 0, alignment: .leading)
                                            .font(.subheadline)
                                            .foregroundColor(Color.white)
                                            .padding(.top, 10)
                                            .padding(.leading, 50)
                                            .padding(.trailing, 50)
                                            .padding(.bottom, 85)
                                        
                                   // }
                                        Spacer()
                                    
                                }
                            //.frame(width: UIScreen.main.bounds.width)
                            //.frame(height: 300)
                            //.background(Color.red)
                            
                        }//END of TIPS words Zstack
                        //.frame(width: UIScreen.main.bounds.width)
                        //.frame(width: UIScreen.main.bounds.width, height: 300)
                       // .background(Color.red)
                        
                        
                    }//End of Tips and Backgorund ZStack
                    .frame(width: UIScreen.main.bounds.width, height: 350)
                }
                //.frame(height: 300)
                .padding(.top, 100)
                
                
                
                
            }
            
            //Page 3
            ZStack{
                
                BlurView(style: .dark)
                    .newPageView(ignoresSafeArea: true, edges: .top)
//
                
                Image("squat")
                
                
                   // .frame(width: 100, height: 100, alignment: .center)
                
            }
        }
        //.padding(.top, 20)
        .ignoresSafeArea(.container, edges: .top) //this essentially fills in the screen all teh way under the home bar
        //.opacity(0.5)
    }
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Circle Buttons - tips
struct CircleButton: View{
    
    let action: () -> Void
    let stroke: CGColor = #colorLiteral(red: 0.670588235294118, green: 0.898039215686275, blue: 0.12156862745098, alpha: 1)
    let color: CGColor = #colorLiteral(red: 0.250980392156863, green: 0.250980392156863, blue: 0.250980392156863, alpha: 0.5)
    let circleView = UIView()
    
    var body: some View {
        
        Button(action: {
            self.action()
        }) {
            Circle()
                .strokeBorder(Color(stroke), lineWidth: 3)
                .background(Circle().fill(Color(color)))
         
                
        }
        .frame(width: 30)
        .cornerRadius(30)
        
    }
}

//enum Tips: String {
//    case neck = "Neck"
//    case core = "Core"
//}

let tips = [
    "Neck" : [
        "Title": "Neck",
        "Content" : "Try to keep you neck straight"
    ]
]

struct TipsContent: View {
    
    //var dictionary: [String : String]
    var key: String
    let title: String = "Title"
    
    
    
    var body: some View {
        Text("\((tips[key]?[title]!)!)")
    }
}


//struct Info: View{
//
//    var body: some View{
//        Text("\(Tips.core.rawValue)")
//    }
//}


