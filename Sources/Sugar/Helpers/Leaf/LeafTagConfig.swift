import Vapor
import Leaf

public extension Application.Leaf {
    /// Register multiple tags using the keys as their names.
    ///
    /// - Parameter list: Map of names to tags.
    mutating func use(_ list: [String: LeafTag]) {
        for item in list {
            self.tags[item.key] = item.value
        }
    }
}
