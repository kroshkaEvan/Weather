//
//  Animation.swift
//  Weather
//
//  Created by Эван Крошкин on 13.03.22.
//

//import SwiftUI
//
//struct CustomAnimationView: UIViewRepresentable {
//    var name: String
//    var loopMode: LottieLoopMode = .loop
//
//    func makeUIView(context: UIViewRepresentableContext<CustomAnimationView>) -> some UIView {
//        let view = UIView()
//        return view
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<CustomAnimationView>) {
//        uiView.subviews.forEach({$0.removeFromSuperview()})
//        let animationView = AnimationView()
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//        uiView.addSubview(animationView)
//        animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor).isActive = true
//        animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor).isActive = true
//        animationView.animation = Animation.named(name)
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = loopMode
//        animationView.play()
//    }
//}
