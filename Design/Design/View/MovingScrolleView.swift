//
//  MovingScrolleView.swift
//  Design
//
//  Created by トム・クルーズ on 2023/05/30.
//

import SwiftUI

struct MovingScrolleView: View {
    // スクロールのoffsetを格納
    @State private var offset = CGFloat.zero
    // もじ
    let sanpleText = "背景が動くよ"
    
    var body: some View {
        ZStack {
            // 背景（うごく）
            BackgroundView(offset: $offset)
            
            ScrollView {
                VStack {
                    ForEach(0..<20) { _ in
                        Text(sanpleText)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(25)
                    }
                }
                .background(GeometryReader { proxy -> Color in
                    DispatchQueue.main.async {
                        offset = -proxy.frame(in: .named("scroll")).origin.y
                        print("offset >> \(offset)")
                    }
                    return Color.clear
                })
            }
        }
    }
}

struct MovingScrolleView_Previews: PreviewProvider {
    static var previews: some View {
        MovingScrolleView()
    }
}
