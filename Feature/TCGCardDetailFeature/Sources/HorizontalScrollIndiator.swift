import SwiftUI

struct HorizontalScrollViewWithCustomIndicator<Content: View>: View {
    
    private let contentBody: () -> Content
    
    /// This view is using custom scroll indicator with its own formula to get the position of the indicator.
    /// You may need to add more param if needed in init
    ///
    /// example:
    ///
    ///      HorizontalScrollViewWithCustomIndicator {
    ///          // put your content view here
    ///      }
    init(@ViewBuilder content: @escaping () -> Content) {
        self.contentBody = content
    }
    
    @State private var scrollPosition: CGPoint = .zero
    @State private var startOffset: CGFloat = 0
    @State private var indicatorOffset: CGFloat = 0
    
    private let indicatorBgWidth: CGFloat = 90
    private let indicatorFrontWidth: CGFloat = 40
    private let indicatorHeight: CGFloat = 6
    private let scrollViewContentHeight: CGFloat = 350
    private let paddingContentToScrollIndicator: CGFloat = 16
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            GeometryReader { geometryParent in
                
                VStack(spacing: 0) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        // MARK: Scroll view content
                        contentBody()
                            .frame(height: scrollViewContentHeight)
                            .offset { rect in
                                
                                // MARK: FINDING SCROLL INDICATOR OFFSET
                                let rectWidth: CGFloat = rect.width
                                let viewWidth: CGFloat = geometryParent.size.width + (startOffset / 2)
                                let totalScrollRange: CGFloat = rectWidth
                                let currentScrollOffset: CGFloat = scrollPosition.x * -1
                                let scrollProgress: CGFloat = (CGFloat(100) * currentScrollOffset) / (totalScrollRange - viewWidth)
                                let indicatorFrontX: CGFloat = ( scrollProgress * (indicatorBgWidth-indicatorFrontWidth) / 100 )
                                indicatorOffset = indicatorFrontX
                                
                            }
                            .background(
                                GeometryReader { geometry in
                                    Color.clear
                                        .preference(
                                            key: ScrollOffsetPreferenceKey.self,
                                            value: geometry.frame(in: .named(Constants.offsetNameSpace)).origin
                                        )
                                }
                            )
                            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                self.scrollPosition = value
                            }
                        
                    }
                    .coordinateSpace(name: Constants.offsetNameSpace)
                    
                    
                    // MARK: Custom scroll view indicator
                    GeometryReader { geometry in
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.gray.opacity(0.3))
                                .frame(width: indicatorBgWidth, height: indicatorHeight)
                                .offset(y: paddingContentToScrollIndicator)
                                .zIndex(0)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: indicatorFrontWidth , height: indicatorHeight)
                                .foregroundColor(.blue)
                                .offset(y: paddingContentToScrollIndicator)
                                .zIndex(1)
                                .offset(x: indicatorOffset)
                        }
                        .position(x: geometry.frame(in: .local).midX)
                        
                    }
                    
                }
                .padding(0)
                
            }
            .offset { rect in
                if startOffset != rect.minX {
                    startOffset = rect.minX
                }
            }
            
        }
        .padding(0)
        
    }
}

extension View {
    /// This `offset` is needed to get the CGRect value from the view
    /// with this function, we can get the values we needed
    @ViewBuilder
    func offset(completion: @escaping (CGRect)->()) -> some View {
        self
            .overlay {
                GeometryReader { geo in
                    let rect = geo.frame(in: .named(Constants.offsetNameSpace))
                    Color.clear
                        .preference(key: OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self) { value in
                            completion(value)
                        }
                }
            }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    /// with this function, we can get the scroll view indicator position
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct Constants {
    static let offsetNameSpace: String = "offset-namespace"
}
