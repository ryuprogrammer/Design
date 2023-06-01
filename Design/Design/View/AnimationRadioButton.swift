//
//  AnimationRadioButton.swift
//  Design
//
//  Created by トム・クルーズ on 2023/06/01.
//

import SwiftUI

struct AnimationRadioButton: View {
    // アイコン
    let iconColor: [Color] = [.red, .orange, .green, .cyan, .blue]
    // 選択されたアイコン（初期値は青）
    @State var selectedIcon: Color = .blue
    
    var body: some View {
        HStack {
            ForEach(iconColor, id: \.self) { color in
                Image(systemName: "highlighter")
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(width: selectedIcon == color ? 60 : 45)
                    .background(color.opacity(0.5))
                    .cornerRadius(8)
                    .shadow(color: color, radius: 5, x: 3, y: 3)
                    .shadow(color: .white.opacity(0.5), radius: 5, x: -3, y: -3)
                    .padding(.leading)
                    .onTapGesture {
                        withAnimation {
                            selectedIcon = color
                        }
                    }
            }
        }
    }
}

struct AnimationRadioButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimationRadioButton()
    }
}
