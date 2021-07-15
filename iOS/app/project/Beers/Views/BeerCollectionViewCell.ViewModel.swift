//
//  BeerCollectionViewCell.ViewModel.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import Foundation

extension BeerCollectionViewCell {
    struct Rating:Codable {
        let rating:Int
        let outOf:Int
    }

    struct ViewModel:Codable {
        let title:String
        let brand:String
        let imageURL:String
        let rating:Rating
    }
}
