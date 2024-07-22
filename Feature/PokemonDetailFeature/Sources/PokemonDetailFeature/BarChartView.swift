import Models
import SwiftUI

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

            HStack {
                Text("\(value)")
                    .frame(width: 50)
                    .padding(.trailing)

                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 180, height: 20)
                        .foregroundColor(Color(.systemGray5))

                    Capsule()
                        .frame(width: animatedWidth, height: 20)
                        .foregroundColor(color)
                        .animation(.easeOut(duration: 1), value: animatedWidth)
                }
                
                Spacer()
            }
            .padding(.leading)
        }
        .onAppear {
            animatedWidth = value > 180 ? CGFloat(180) : CGFloat(value)
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
        VStack {
            ForEach(Array(pokemon.details.stats.enumerated()), id: \.offset) { index, stat in
                BarView(value: stat.baseStat, title: "\(stat.stat.name.capitalized)", color: colorArray[index % colorArray.count])
            }
            BarView(value: pokemon.details.height, title: "Height", color: colorArray[pokemon.details.stats.count % colorArray.count])
            BarView(value: pokemon.details.weight, title: "Weight", color: colorArray[(pokemon.details.stats.count + 1) % colorArray.count])
        }
    }
}
