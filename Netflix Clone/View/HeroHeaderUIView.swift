//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 01/09/2022.
//

import UIKit

class HeroHeaderUIView: UIView {

    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "hero")
        return imageView
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(heroImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder:NSCoder)
    {
        fatalError()
    }
}
