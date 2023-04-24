import Crypto

public extension String {
    static func randomAlphaNumericString(_ length: Int = 64) -> String {
        let letters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = letters.count

        var randomString = ""
        for _ in 0 ..< length {
            let rand = Int.random(0...len-1)
            let char = letters[letters.index(letters.startIndex, offsetBy: rand)]
            randomString += String(char)
        }

        return randomString
    }
}
