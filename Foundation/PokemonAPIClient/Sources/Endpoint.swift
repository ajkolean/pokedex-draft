import Foundation

enum Endpoint: String {
    case berry
    case berryFirmness = "berry-firmness"
    case berryFlavor = "berry-flavor"
    case contestType = "contest-type"
    case contestEffect = "contest-effect"
    case superContestEffect = "super-contest-effect"
    case encounterMethod = "encounter-method"
    case encounterCondition = "encounter-condition"
    case encounterConditionValue = "encounter-condition-value"
    case evolutionChain = "evolution-chain"
    case evolutionTrigger = "evolution-trigger"
    case generation
    case pokedex
    case version
    case versionGroup = "version-group"
    case item
    case itemAttribute = "item-attribute"
    case itemCategory = "item-category"
    case itemFlingEffect = "item-fling-effect"
    case itemPocket = "item-pocket"
    case location
    case locationArea = "location-area"
    case palParkArea = "pal-park-area"
    case region
    case machine
    case move
    case moveAilment = "move-ailment"
    case moveBattleStyle = "move-battle-style"
    case moveCategory = "move-category"
    case moveDamageClass = "move-damage-class"
    case moveLearnMethod = "move-learn-method"
    case moveTarget = "move-target"
    case ability
    case characteristic
    case eggGroup = "egg-group"
    case gender
    case growthRate = "growth-rate"
    case nature
    case pokeathlonStat = "pokeathlon-stat"
    case pokemon
    case pokemonColor = "pokemon-color"
    case pokemonForm = "pokemon-form"
    case pokemonHabitat = "pokemon-habitat"
    case pokemonShape = "pokemon-shape"
    case pokemonSpecies = "pokemon-species"
    case stat
    case type
    case language
}
