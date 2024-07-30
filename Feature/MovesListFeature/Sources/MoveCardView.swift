import ComposableArchitecture
import Models
import SwiftUI

struct MoveCardView: View {
    let move: Move.Summary

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()

                    move
                        .type
                        .icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .opacity(0.5)
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(move.name.rawValue.capitalized)
                        .font(.headline)
                        .bold()

                    Group {
                        HStack(spacing: 2) {
                            Text("Accuracy:")
                                .bold()
                            Text(move.accuracyString)
                                .italic()
                        }

                        HStack(spacing: 2) {
                            Text("PP:")
                                .bold()
                            Text(move.ppString)
                                .italic()
                        }
                        HStack(spacing: 2) {
                            Text("Power:")
                                .bold()
                            Text(move.powerString)
                                .italic()
                        }
                    }
                    .font(.caption)
                }
                .foregroundColor(.white)
                .padding(.top, 12)
                .padding(.bottom, 16)
                .padding(.leading)

                Spacer()
            }
        }
        .background(move.type.color())
        .cornerRadius(12)
        .shadow(color: move.type.color(), radius: 4, x: 1.0, y: 1.0)
    }
}
