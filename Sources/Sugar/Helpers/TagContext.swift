import LeafKit

extension LeafContext {
    /// Throws an error if the parameter count is larger than the supplied number `n`.
    public func requireParameterCount(upTo n: Int) throws {
        guard parameters.count <= n else {
            throw "Invalid parameter count: \(parameters.count)/\(n)"
        }
    }
}
