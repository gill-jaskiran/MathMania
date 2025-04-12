//
//  SplashView.swift
//  MathMania
//
//  Created by Jaskiran Gill on 2025-03-29.
//  Edited by Elizabeth Thomas on 2025-04-05.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Text("Math Mania")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Instructions:")
                    .font(.title2)
                    .padding(.top, 20)
                
                Text("""
                - A random number will appear.
                - Click 'Odd' if the number is odd.
                - Click 'Even' if the number is even.
                - If correct, you advance to the next level.
                - Complete 3 levels to see the leaderboard!
                """)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Created By:")
                    .font(.title3)
                    .padding(.top, 20)
                Text("Jaskiran Gill")
                    .font(.title3)
                Text("Elizabeth Thomas")
                    .font(.title3)
                
                Spacer()
            }
            .padding()
            .onAppear {
                
                // The spash view will only display for 10 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
#Preview {
    SplashView()
}
