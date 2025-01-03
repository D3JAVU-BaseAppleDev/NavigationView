//
//  Public+View.swift of NavigationView
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - Removing Views From Stack
public extension View {
    /// Removes the presented view from the stack
    func pop() { NavigationManager.pop() }

    /// Removes all views up to the selected view in the stack. The view from the argument will be the new active view
    func pop<N: NavigatableView>(to view: N.Type) { NavigationManager.pop(to: view) }

    /// Removes all views from the stack. Root view will be the new active view
    func popToRoot() { NavigationManager.popToRoot() }
}

// MARK: - Actions
public extension View {
    /// Triggers every time the popup is at the top of the stack
    func onFocus(_ view: some NavigatableView, perform action: @escaping () -> ()) -> some View {
        onReceive(NavigationManager.shared.$views) { views in
            if views.last?.id == view.id { action() }
        }
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
