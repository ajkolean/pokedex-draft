import SwiftUI
import Models

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct MeasureSize: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

extension View {
    func measureSize() -> some View {
        self.modifier(MeasureSize())
    }
}


struct MoveDetailStatView: View {
    let move: Move.Summary
    
    @State private var minTitleWidth: CGFloat = 0
    @State private var minValueWidth: CGFloat = 0
    
    var body: some View {
        VStack {
            BarView(
                value: move.pp ?? 0,
                valueText: move.ppString,
                title: "PP",
                color: .green,
                maxValue: Move.Summary.maxPP,
                minTitleWidth: $minTitleWidth,
                minValueWidth: $minValueWidth
            )
            
            BarView(
                value: move.accuracy ?? 0,
                valueText: move.accuracyString, 
                title: "Accuracy",
                color: .blue,
                maxValue: Move.Summary.maxAccurancy,
                minTitleWidth: $minTitleWidth,
                minValueWidth: $minValueWidth
            )
            BarView(
                value: move.power ?? 0,
                valueText: move.powerString,
                title: "Power",
                color: .red,
                maxValue: Move.Summary.maxPower,
                minTitleWidth: $minTitleWidth,
                minValueWidth: $minValueWidth
            )
            
            BarView(
                value: move.priority.map { $0 + 5 } ?? 0,
                valueText: move.priorityString,
                title: "Priority",
                color: .purple,
                maxValue: Move.Summary.maxPriority,
                minTitleWidth: $minTitleWidth,
                minValueWidth: $minValueWidth
            )
        }
        .boxStyle()
    }
}



public struct BarView: View {
    public var value: Int = 0
    public var valueText: String = ""
    public var title: String = "HP"
    public var color: Color = .blue
    public var maxValue: Int
    @Binding var minTitleWidth: CGFloat
    @Binding var minValueWidth: CGFloat
    
    @State private var animatedWidth: CGFloat = 0
    @State private var geometryWidth: CGFloat = 0
    
    public var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .foregroundColor(.gray)
                .measureSize()
                .onPreferenceChange(SizePreferenceKey.self) { size in
                    minTitleWidth = max(minTitleWidth, size.width)
                }
                .frame(minWidth: minTitleWidth, alignment: .leading)
            
            Text(valueText)
                .measureSize()
            
                .onPreferenceChange(SizePreferenceKey.self) { size in
                    minValueWidth = max(minValueWidth, size.width)
                }
                .frame(minWidth: minValueWidth, alignment: .leading)
            
            ZStack(alignment: .leading) {
                GeometryReader { geometry in
                    Capsule()
                        .frame(height: 12)
                        .foregroundColor(Color(.systemGray5))
                    
                    Capsule()
                        .frame(width: animatedWidth, height: 12)
                        .foregroundColor(color)
                        .onChange(of: geometry.size.width) { _, newValue in
                            geometryWidth = newValue
                            animatedWidth = CGFloat(value) / CGFloat(maxValue) * newValue
                        }
                        .animation(.easeOut(duration: 1), value: animatedWidth)
                }
            }
            .frame(height: 12)
        }
        
    }
}
