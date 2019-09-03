extension String{
    func toEndCoding() -> [EAN13BarcodeGenerator.DigitEndcoding.EndCoding]{
        return self.lowercased().compactMap {
            EAN13BarcodeGenerator
                .DigitEndcoding
                .EndCoding(rawValue: String($0))
        }
    }
}
