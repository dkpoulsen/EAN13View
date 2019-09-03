struct EAN13BarcodeGenerator{
    
    struct DigitEndcoding {
        
        enum EndCoding: String {
            case l
            case g
            case r
        }
        
        let bitValue: String
        init?(value: Int, endCoding: EndCoding) {
            guard value <= 9 && value >= 0 else { return nil }
            let code = DigitEndcoding.rValues[value]
            switch endCoding {
            case .r:
                bitValue = String(code, radix: 2)
            case .g:
                bitValue = String(String(code, radix: 2).reversed())
            case .l:
                bitValue = String(~code, radix: 2)
            }
        }
        
        private static var rValues: [UInt8] {
            return [114, // 0
                102, // 1
                108, // .
                66,  // .
                92,
                78,
                80,
                68,
                72,
                116] // 9
        }
    }
    
    let secondCoding: [String] = [
        "LLLLLL",
        "LLGLGG",
        "LLGGLG",
        "LLGGGL",
        "LGLLGG",
        "LGGLLG",
        "LGGGLL",
        "LGLGLG",
        "LGLGGL",
        "LGGLGL"
    ]
    
    func generate(value: [Int]) -> [Bool]{
        let secondEndcoding = secondCoding[value.first!]
            .toEndCoding()
        let second = zip(value[1...6], 0...5).compactMap{ value, index -> String in
            return DigitEndcoding(value: value, endCoding: secondEndcoding[index])!.bitValue
            }.reduce("", { a, b in
                a + b
            })
        let third = value[7...12].compactMap{ value -> String in
            return DigitEndcoding(value: value, endCoding: .r)!.bitValue
            }.reduce("", { a, b in
                a + b
            })
        let stringValue = "101" + second + "01010" + third + "101"
        return stringValue.map{$0 == Character("0") ? false : true}
    }
}
