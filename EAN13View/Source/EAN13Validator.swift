struct EAN13Validator{
    
    func isValid(value: [Int]) -> Bool{
        guard value.count == 13 else { return false }
        
        var sumOddPosition = 0
        var sumEvenPosition = 0
        
        for (index, digit) in value.prefix(12).enumerated() {
            if index % 2 == 0 {
                sumOddPosition += digit
            } else {
                sumEvenPosition += digit
            }
        }
        
        let checkDigit = (10 - (sumOddPosition + sumEvenPosition * 3) % 10) % 10
        return value.last == checkDigit
    }
}
