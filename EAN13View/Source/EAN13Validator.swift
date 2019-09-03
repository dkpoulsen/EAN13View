struct EAN13Validator{
    
    func isValid(value: [Int]) -> Bool{
        guard value.count == 13 else { return false }
        
        let even = value.prefix(12).filter{$0 % 2 == 0}.reduce(0) { a, b in
            a + b
        }
        let odd = value.prefix(12).filter{$0 % 2 == 1}.reduce(0) { a, b in
            a + b
        }
        let checkDigit = (10 - (even + odd * 3) % 10) % 10
        return value.last! == checkDigit
    }
}
