//
//  CharacterDetailsViewController.swift
//  RickAndMortyApi
//
//  Created by Игорь Чумиков on 06.10.2021.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = characterImageView.frame.width / 2
        }
    }
    
    // MARK: - Public properties
    var character: Result!

    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = character.name
        descriptionLabel.text = character.description
        guard let url = URL(string: character.image) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        characterImageView.image = UIImage(data: data)
    }
}

