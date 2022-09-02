//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 02/09/2022.
//

import Foundation

extension String{
    func capitalizeFirstLetter()-> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
