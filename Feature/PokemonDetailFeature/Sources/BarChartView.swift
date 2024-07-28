import PokemonGraphClientInterface
import SwiftUI
import Models

struct BarView: View {
    var value: Int = 0
    var title: String = "HP"
    var color: Color = .blue

    @State private var animatedWidth: CGFloat = 0

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 32)
                .foregroundColor(.gray)
                .frame(width: 100)

            Text("\(value)")
                .padding([.leading, .trailing])

            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: 200, height: 20)
                    .foregroundColor(Color(.systemGray5))

                Capsule()
                    .frame(width: animatedWidth, height: 20)
                    .foregroundColor(color)
                    .animation(.easeOut(duration: 1), value: animatedWidth)
            }
        }
        .onAppear {
            animatedWidth = value > 200 ? CGFloat(200) : CGFloat(value)
        }
    }
}

struct BarChartView: View {
    let pokemon: Pokemon

    var colorArray: [Color] = [
        .red,
        .indigo,
        .orange,
        .yellow,
        .green,
        .blue,
        .purple,
        .mint,
        .teal,
        .cyan,
        .pink,
    ]

    var body: some View {
        VStack(spacing: 16) {
            ForEach(Array(pokemon.stats.enumerated()), id: \.offset) { index, stat in
                let title = stat.name.capitalized
                    .replacingOccurrences(of: "Special-Attack", with: "Sp. Atk")
                    .replacingOccurrences(of: "Special-Defense", with: "Sp. Def")
                BarView(value: stat.baseStat, title: "\(title)", color: colorArray[index % colorArray.count])
            }
        }
    }
}
