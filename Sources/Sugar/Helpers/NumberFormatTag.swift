import Leaf

/// A custom leaf tag to format a number to a fixed amount of decimals
/// REGISTER TAG: 
///   tags.use(NumberFormatTag(), as: "numberformat")
///
/// USAGE: 
///   #numberformat(100.3333333333, "2")
///   = 100.33
///
/// - Parameters:
///   - number: Double
///   - decimals: Int (default: 2 decimals)
public final class NumberFormatTag: LeafTag {
    public init() {}

    public func render(_ ctx: LeafContext) throws -> LeafData {
        guard let number = ctx.parameters[safe: 0]?.double else {
            throw "Expected a number"
        }
        let decimals = ctx.parameters[safe: 1]?.int ?? 2

        let formattedNumber = String(format: "%.*f", decimals, number)

        return .string(formattedNumber)
    }
    
    
}
