//
//  SearchValidation.swift
//  LongFormTest
//
//  
//

import Foundation

struct SearchValidation {
    
    func Validate(searchRequest: SearchRequest) -> SearchValidationResult {
        
        if(searchRequest.sf!.isEmpty)
        {
            return SearchValidationResult(success: false, error: Constants.EmptyText)
        }
        
        let decimalCharacters = CharacterSet.decimalDigits

        let decimalRange = searchRequest.sf!.rangeOfCharacter(from: decimalCharacters)

        if decimalRange != nil {
            return SearchValidationResult(success: false, error: Constants.NumberText)
        }
        
        return SearchValidationResult(success: true, error: "")
    }
    
}
