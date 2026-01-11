extension String{
    func toEncoding() -> [EAN13BarcodeGenerator.DigitEncoding.Encoding]{
        return self.lowercased().compactMap {
            EAN13BarcodeGenerator
                .DigitEncoding
                .Encoding(rawValue: String($0))
        }
    }
}
