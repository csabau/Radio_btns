//
//  PagerHelper.swift
//  PagerTabs
//
//  Created by Caius Sabau on 31/03/2022.
//

import SwiftUI

//Custome View Builder

struct PagerTabView<Content: View, Label: View>: View {
    
    var content: Content
    var label: Label
    //Label Tint
    var tint: Color
    //Capsule tint
    var tint2: Color
    //Selection
    @Binding var selection: Int
    
    
    
    init(tint: Color, tint2: Color, selection: Binding<Int>, @ViewBuilder labels: @escaping ()->Label, @ViewBuilder content: @escaping ()->Content){
        self.content = content()
        self.label = labels()
        self.tint = tint
        self.tint2 = tint2
        self._selection = selection
}
    
    //Offset for Page Scroll
    @State var offset: CGFloat = 0
    
    @State var maxTabs: CGFloat = 0
    
    @State var tabOffset: CGFloat = 0

    var body: some View {
        
            
            ZStack{
               //1.Content Pages on the packground
            
                OffsetPageTabView(selection: $selection, offset: $offset){
                    
                    HStack(spacing: 0){
                        content
                    }
                    //Getting how many tabs are there by getting the total content size
                    .overlay(
                        
                        GeometryReader{proxy in
                            
                           Color.clear
                                .preference(key: TabPreferenceKey.self, value: proxy.frame(in: .global))
                            
                        }
                    
                    )
                    //When value Changes
                    .onPreferenceChange(TabPreferenceKey.self){ proxy in
                        
                        let minX = -proxy.minX
                        let maxWidth = proxy.width
                        let screenWidth = getScreenBound().width
                        let maxTabs = (maxWidth / screenWidth).rounded()
                        
                        
                        //Getting Tab Offset
                        let progress = minX / screenWidth
    //                    let tabOffset = progress * (screenWidth / maxTabs)
                        let tabOffset = progress * 210 //70 is set to be label width and there's 3 labels
                        
                        self.tabOffset = tabOffset
                        
                        self.maxTabs = maxTabs
                        
                    }
                }// END OffsetPage
                
                //2.Menu labels
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        label
                    }
                    //For tap to change tab
                    .overlay(
                        HStack(spacing: 0){
                            ForEach(0..<Int(maxTabs), id: \.self){index in
                                Rectangle()
                                    .fill(Color.black.opacity(0.01))
                                    .onTapGesture {
                                        //Changing Offset based on index
                                        let newOffset = CGFloat(index) * getScreenBound().width
                                        self.offset = newOffset
                                    }
                                
                            }
                        }
                    
                    )
                    .foregroundColor(tint)
                    .padding(.top, 55)
                    
                    //Indicator
                    Capsule()
                        .fill()
                        .foregroundColor(tint2)
                        .frame(width: maxTabs == 0 ? 0 : 70 , height: 3)
                        .padding(.top,5)
                        .frame(width: 210 ,alignment: .leading)
                        .offset(x:tabOffset / 3)
                    Spacer()
                }//End of VStack
                
                
            }//End of ZStack
        
    }
}

struct PagerHelper_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Geometry Preference
struct TabPreferenceKey: PreferenceKey{
    
    static var defaultValue: CGRect = .init()
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}


//Extending View for PageLabel and PageView
extension View{
    func pageLabel() ->some View{
        //Just fill all empty Space
        //this pushes the button lables all the way to the width of the screen
        self
            .frame(width: 70 ,alignment: .center)
    }
    //Modification for SafeArea Ignoring
    //same for PageView
    func pageView(ignoresSafeArea: Bool = false, edges: Edge.Set = [])->some View{
        //Just fill all empty Space
        //this pushes the button lables all the way to the width of the screen
        self
            .frame(width: getScreenBound().width ,alignment: .center)
            .ignoresSafeArea(ignoresSafeArea ? .container : .init(), edges: edges)
    }
    
    func newPageView(ignoresSafeArea: Bool = false, edges: Edge.Set = [])->some View{
        //Just fill all empty Space
        //this pushes the button lables all the way to the width of the screen
        self
            .frame(width: getScreenBound().width, height: getScreenBound().height ,alignment: .center)
            .ignoresSafeArea(ignoresSafeArea ? .container : .init(), edges: edges)
    }
    
    
    //newPage View
    func firstPageView()->some View{
        //Just fill all empty Space
        //this pushes the button lables all the way to the width of the screen
        self
            .opacity(0.0)
            .frame(width: getScreenBound().width , height: 50)
            
    }
    
    //Getting Screen Bounds
    func getScreenBound()->CGRect{
        return UIScreen.main.bounds
    }
}
