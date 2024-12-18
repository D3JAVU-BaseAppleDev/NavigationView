//
//  View++.swift
//  MijickNavigationView
//
//  Created by MijickNavigationView on 2024/12/18.
//
        

import SwiftUI
import Swift

private struct WithInlineState<Value, Content: View>: View {
    @State var value: Value
    
    let content: (Binding<Value>) -> Content
    
    init(
        initialValue: Value,
        @ViewBuilder content: @escaping (Binding<Value>) -> Content
    ) {
        self._value = .init(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

private func withInlineState<Value, Content: View>(
    initialValue: Value,
    @ViewBuilder content: @escaping (Binding<Value>) -> Content
) -> some View {
    WithInlineState(initialValue: initialValue, content: content)
}

extension View {
    func onAppearOnce(perform action: @escaping () -> Void) -> some View {
        withInlineState(initialValue: false) { $didAppear in
            self.onAppear {
                guard !didAppear else {
                    return
                }
                
                action()
                
                didAppear = true
            }
        }
    }
}
