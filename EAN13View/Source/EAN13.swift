public struct EAN13{
 
    enum Error: Swift.Error {
        case invalidEAN
    }
    
    let lines: [Bool]
    
    private let value: String
    private let validator = EAN13Validator()
    
    public init(value: String) throws {
        self.value = value
        let numbers = value
            .compactMap{String($0)}
            .compactMap{Int($0)}
        
        guard validator.isValid(value: numbers) else { throw Error.invalidEAN }
        lines = EAN13BarcodeGenerator().generate(value: numbers)
    }
}
