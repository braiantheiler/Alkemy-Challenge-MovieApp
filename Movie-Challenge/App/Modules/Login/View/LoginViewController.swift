

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var inputMail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputMail.text = ""
    }
    
    
    
    @IBAction func btnEmpezar(_ sender: Any) {
        
        if isValidEmail(inputMail.text!) {
            let movieListViewController = MovieListViewController()
            self.navigationController?.pushViewController(movieListViewController, animated: true)
        }
        else {
            
            let message = "Por favor ingrese un correo electrónico correctamente para acceder!"
            
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        }

    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    

}
