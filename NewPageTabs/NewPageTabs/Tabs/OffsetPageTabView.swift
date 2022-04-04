//
//  OffsetTabView.swift
//  PagerTabs
//
//  Created by Caius Sabau on 31/03/2022.
//

import SwiftUI

//Custom View that will return offset for Paging Control

struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    @Binding var selection: Int
    
    
    func makeCoordinator() -> Coordinator {
        return OffsetPageTabView.Coordinator(parent: self)
    }
    
    init(selection: Binding<Int>, offset: Binding<CGFloat>, @ViewBuilder content: @escaping ()->Content){
        
        self.content = content()
        self._offset = offset
        self._selection = selection
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        //Extracting SwiftUI View and embedding into UIKit ScrollView
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        hostview.view.backgroundColor = .clear
        hostview.view.isOpaque = false
        
        let constraints = [
            
            hostview.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            //if you are using vertical Paging, then don't declare height constraint
            hostview.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ]
        
        scrollView.addSubview(hostview.view)
        scrollView.addConstraints(constraints)
        
        //Enabling Paging
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        //setting Delegate
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        //need to update only when offset changed manuall
        //just check the current and scrollView offsets
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
            print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    //Pager Offset
    class Coordinator: NSObject,UIScrollViewDelegate {
        
        var parent: OffsetPageTabView
        
        init(parent: OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            //Safer side updating selection on scroll
            let maxSize = scrollView.contentSize.width
            let currentSelection = (offset / maxSize).rounded()
            parent.selection = Int(currentSelection)
            
            parent.offset = offset
            
        }
    }
        
   
}

//struct OffsetPageTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
