//
//  PlayButtonView.swift
//  SwiftPamphletApp
//
//  Created by Ming Dai on 2022/2/14.
//

import SwiftUI

struct PlayButtonView: View {
    var body: some View {
        VStack {
            PCustomButton("点我") {
                print("Clicked!")
            }
            
            // 将 Text 视图加上另一个 Text 视图中，类型仍还是 Text。
            PCustomButton(Text("点我 ").underline() + Text("别犹豫").font(.title) + Text("🤫悄悄说声，有惊喜").font(.footnote).foregroundColor(.secondary)) {
                print("多 Text 组合标题按钮点击！")
            }
        }
        .padding()
    }
}

struct PCustomButton: View {
    let desTextView: Text
    let act: () -> Void
    
    init(_ des: LocalizedStringKey, act: @escaping () -> Void) {
        self.desTextView = Text(des)
        self.act = act
    }
    
    var body: some View {
        Button {
            act()
        } label: {
            desTextView.bold()
        }
        .buttonStyle(PCustomButtonStyle())

    }
}

extension PCustomButton {
    init(_ desTextView: Text, act: @escaping () -> Void) {
        self.desTextView = desTextView
        self.act = act
    }
}

struct PCustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.pink)
        )
        .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
