//
//  CustomTabBarView.swift
//  Design
//
//  Created by トム・クルーズ on 2023/05/27.
//

import SwiftUI

struct CustomTabBarView: View {
    /// View Properties
    @State private var activeTab: CustomTabBarView_Tab = .home
    /// For Smooth Shape Sliding Effect, We' re going to use Mached Geometry Effect
    @Namespace private var animation
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text("Home")
                    .tag(CustomTabBarView_Tab.home)
                    /// Hiding Native Tab Bar
                    .toolbar(.hidden, for: .tabBar)
                
                Text("Services")
                    .tag(CustomTabBarView_Tab.services)
                    /// Hiding Native Tab Bar
                    .toolbar(.hidden, for: .tabBar)
                
                Text("Partners")
                    .tag(CustomTabBarView_Tab.partners)
                    /// Hiding Native Tab Bar
                    .toolbar(.hidden, for: .tabBar)
                
                Text("Activity")
                    .tag(CustomTabBarView_Tab.activity)
                    /// Hiding Native Tab Bar
                    .toolbar(.hidden, for: .tabBar)
            }
            
            // タブバーを表示
            CustomTabBar()
        }
    }
    
    /// Custom Tab Bar
    /// With More Easy Customization
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color.blue, _ inactiveTint: Color = .blue) ->
    some View {
        /// Moving all the Remaining Tab Item' s to Button
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(CustomTabBarView_Tab.allCases, id: \.rawValue) {
                TabItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        animation: animation,
                        activeTab: $activeTab)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                /// Adding Blur + Shadow
                ///  For Shape Smoothing
                .shadow(color: tint.opacity(0.1), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        /// Adding Animation
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

/// Tab Ber Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: CustomTabBarView_Tab
    var animation: Namespace.ID
    @Binding var activeTab: CustomTabBarView_Tab
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                /// Increasing Size for the Active Tab
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            // これで動くんか
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            activeTab = tab
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
