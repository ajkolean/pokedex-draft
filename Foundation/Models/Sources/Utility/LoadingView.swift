import SwiftUI

public struct LoadingOverlayView: View {
    @State private var isAnimating = false

    public init() {}

    public var body: some View {
        ModelsAsset.spinningball.swiftUIImage
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .scaledToFit()
            .frame(width: 230, height: 230)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .transition(.opacity)
            .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
            .onDisappear {
                isAnimating = false
            }
    }
}
