import UIKit

class ViewController: UIViewController {
    
@IBOutlet var buton: UIButton!
@IBOutlet var imageView: UIImageView!
var currentPokemon: Pokemon? = nil
var currentImage: UIImage? = nil

override func viewDidLoad() {
super.viewDidLoad()
buton.isHidden = true
}
    
@IBAction func roll() {
Task {
buton.setTitle("読み込み中...", for: .normal)
buton.isEnabled = false
buton.isHidden = false
// ポケモンをランダムに取得
let (pokemon, pokemonImage) = try! await fetchRandomPokemon()
// 画面遷移用に保存
currentImage = pokemonImage
currentPokemon = pokemon

// 画像を反映
imageView.image = pokemonImage
buton.setTitle("詳細へ", for: .normal)
buton.isEnabled = true
}
}
    
    @IBAction func toPokemonDetail() {
        performSegue(withIdentifier: "toPokemonDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokemonDetail" {
            let destination = segue.destination as! PokemonDetailViewController
            destination.pokemonImage = currentImage
            destination.pokemon = currentPokemon
        }
    }
}

