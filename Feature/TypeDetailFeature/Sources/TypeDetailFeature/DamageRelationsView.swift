import Models
import SwiftUI

struct DamageRelationsStackView: View {
    let typeIdentifier: TypeIdentifier
    let typeDetails: PokemonTypeDetails

    var color: Color {
        typeIdentifier.type.color()
    }

    var body: some View {
        VStack(spacing: 30) {
            offensivePropertiesView
            defensiveProperties
        }
        .padding()
    }

    var offensivePropertiesView: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Offensive properties of \(typeDetails.name.capitalized)-type moves")
                .font(.headline)
                .multilineTextAlignment(.center)
                .bold()
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(color: color, radius: 4, x: 1.0, y: 1.0)

            HStack(alignment: .top, spacing: 8) {
                DamageRelationView(title: "Super effective (×2)", types: typeDetails.damageRelations.doubleDamageTo)
                DamageRelationView(title: "Not very effective (×½)", types: typeDetails.damageRelations.halfDamageTo)
                DamageRelationView(title: "No effect (×0)", types: typeDetails.damageRelations.noDamageTo)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .frame(maxWidth: .infinity)
            .shadow(color: Color.gray, radius: 4, x: 1.0, y: 1.0)
        }
    }

    var defensiveProperties: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Defensive properties of \(typeDetails.name.capitalized)-type Pokémon")
                .font(.headline)
                .multilineTextAlignment(.center)
                .bold()
                .padding()
                .background(color)
                .foregroundColor(Color(UIColor.systemBackground))
                .cornerRadius(8)
                .shadow(color: color, radius: 4, x: 1.0, y: 1.0)

            HStack(alignment: .top, spacing: 8) {
                DamageRelationView(title: "Weak to (×2)", types: typeDetails.damageRelations.doubleDamageFrom)
                DamageRelationView(title: "Resists (×½)", types: typeDetails.damageRelations.halfDamageFrom)
                DamageRelationView(title: "Immune to (×0)", types: typeDetails.damageRelations.noDamageFrom)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .frame(maxWidth: .infinity)
            .shadow(color: Color.gray, radius: 4, x: 1.0, y: 1.0)
        }
    }
}

struct DamageRelationView: View {
    var title: String
    var types: [TypeIdentifier]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(height: 75)
            .frame(maxWidth: 80)

            ForEach(types, id: \.self) { type in
                TypeCapsuleView(identifier: type)
            }
            Spacer()
        }
    }
}

struct TypeCapsuleView: View {
    var identifier: TypeIdentifier

    var color: Color {
        identifier.type.color()
    }

    var body: some View {
        HStack(spacing: 0) {
            identifier.type.icon
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color(UIColor.systemBackground))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(color)
                .shadow(color: color.opacity(0.6), radius: 4, x: 0, y: 2)

            Text(identifier.name)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .lineLimit(1)
        }
        .background(Color.gray)
        .clipShape(Capsule())
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
