//
//  ViewController.swift
//  Test
//
//  Created by user184058 on 11/12/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var LabelEdadHumana: UILabel!
    
    @IBOutlet weak var InputEdadHumana: UITextField!
    
    @IBOutlet weak var razalabel: UILabel!
    

    @IBOutlet weak var InputRaza: UITextField!
    
    @IBOutlet weak var btnfunction: UIButton!
    
    @IBOutlet weak var ContenedorVistar: UIView!
    
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBAction func btnAction(_ sender: Any) {
    var datos: [String] = ["nulo","nulo"]
        datos[0] = (InputRaza.text)!
        datos[1] =  (InputEdadHumana.text)!
        
        if !datos[0].isEmpty && !datos[1].isEmpty{
            let edad = Int(datos[1])
            let raza = datos[0]
            if edad != nil {
                correrApp(raza, edad!)
            }else{
                mensajeDefaultEdad()            }
        }else{
            mensajeDefault()
        }
       
              
    }	

    func alertView() {
        let alerView = UIAlertController(title: "Alerta", message: "esto es un alertView", preferredStyle: UIAlertController.Style.alert )
        alerView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil ))
        self.present(alerView, animated: true, completion: nil)
    }
    
    
private let colorPrimario =	UIColor(red: 56/255	, green: 117/255, blue: 233/255, alpha: 1)
private let colorSecundario =    UIColor(red: 173/255    , green: 202/255, blue: 250/255, alpha: 1)
private let colorTerciario =    UIColor(red: 254/255    , green: 254/255, blue: 254/255, alpha: 1)
private let colorAlert = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
private let colorSucces = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Modificar aspectos visuales app
// para hacer redondeando el logo"
        
        
        ContenedorVistar.layer.borderColor = colorTerciario.cgColor
        ContenedorVistar.layer.borderWidth = 1
        ContenedorVistar.layer.cornerRadius = 20
        ContenedorVistar.clipsToBounds = true
        
        // Boton de calcular
        btnfunction.backgroundColor = colorPrimario
        btnfunction.setTitleColor(colorSecundario, for: .normal)
        btnfunction.layer.cornerRadius = 10
        btnfunction.clipsToBounds = true
        
        InputRaza.backgroundColor = colorPrimario
        InputRaza.placeholder = " ingrese la raza del Perro"
        InputRaza.textColor = colorTerciario
        InputRaza.tintColor  = colorAlert
        InputRaza.clipsToBounds = true
        
        InputEdadHumana.backgroundColor = colorPrimario
        InputEdadHumana.placeholder = " Ingresa la edad "
        InputEdadHumana.textColor = colorTerciario
        InputEdadHumana.tintColor  = colorAlert
        
        InputEdadHumana.keyboardType = UIKeyboardType.numberPad
        InputEdadHumana.keyboardAppearance = UIKeyboardAppearance.dark
        InputEdadHumana.clipsToBounds = true

        
    }
        var edadPerros = 0
        var auxValidador = false

        
        
        func validarValores( _ edad: Int) -> (Bool){
            if edad > 0 {
                auxValidador = true
            }else {
                auxValidador = false
            }
            return auxValidador
        }
        
        

    func mensaje(_ raza: String, _ edad: Int , _ edadPerros: Int){
        
        let alerView = UIAlertController(title: "Informacion", message: "Tu Perro de raza : \(raza) y  tiene : \(edad) años perrunos, lo que equivale a : \(edadPerros) años humanos  " , preferredStyle: UIAlertController.Style.alert )
        alerView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil ))
        self.present(alerView, animated: true, completion: nil)
        btnfunction.backgroundColor = colorSucces
        InputRaza.backgroundColor = colorPrimario
        InputEdadHumana.backgroundColor = colorPrimario
            
            //print("Tu Perro de raza : \(raza) y  tiene : \(edad) años perrunos, lo que equivale a : \(edadPerros) años humanos  "  )
            if edadPerros > 100 {
                print( "Esta Seguro que no es una momia o un robot")
            }
            }
    
    
    func mensajeDefault(){
            let alerView = UIAlertController(title: "Datos Erroneos", message: "Ingresa datos correctos", preferredStyle: UIAlertController.Style.alert )
            alerView.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: nil ))
            self.present(alerView, animated: true, completion: nil)
            InputRaza.backgroundColor = colorAlert
            InputEdadHumana.backgroundColor = colorAlert
            btnfunction.backgroundColor = colorAlert
            btnfunction.setTitle("Otra Vez", for: .normal)
        }
    func mensajeDefaultRaza(){
        let alerView = UIAlertController(title: "Datos Erroneos", message: "Ingresa una raza valida", preferredStyle: UIAlertController.Style.alert )
        alerView.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: nil ))
        self.present(alerView, animated: true, completion: nil)
        InputRaza.backgroundColor = colorAlert
        btnfunction.backgroundColor = colorAlert
        btnfunction.setTitle("Otra Vez", for: .normal)
    }
    
    func mensajeDefaultEdad(){
        let alerView = UIAlertController(title: "Datos Erroneos", message: "Ingresa una edad valida", preferredStyle: UIAlertController.Style.alert )
        alerView.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: nil ))
        self.present(alerView, animated: true, completion: nil)
        InputEdadHumana.backgroundColor = colorAlert
        btnfunction.backgroundColor = colorAlert
        btnfunction.setTitle("Otra Vez", for: .normal)
    }
        
    func casePequeña(_ edad:Int) -> Int{
            edadPerros = ( 16 + (edad*4))
            return(edadPerros)
        }
        
        func caseMediana(_ edad: Int) -> Int{
            let aux = edad%2
            if edad <= 5 {
                edadPerros = ( 12 + (edad*5))
            }else {
                if aux == 0 {
                edadPerros = ( 15 + (edad * (45/10)))
                }else{
                    let x = ( 15.5 + (Double(edad) * (4.5)))
                   edadPerros = Int(x)
                edadPerros = ( (155/10) + (edad * (45/10)))
                }
            }
            return edadPerros

        }
        let razaGrande = [5:40,6:45,7:50,8:55,9:61,10:66,11:77,1:77,13:82,14:88,15:93]
        func caseGrande(_ edad: Int) -> Int{
            // Use un Unwrapping :O
            edadPerros = razaGrande[edad]!
            return edadPerros
        }
        
        let razaGigante = [5:42,6:49,7:56,8:64,9:71,10:78,11:86,12:93,13:101, 14:108, 15:115]
        func caseGigante(_ edad: Int) -> Int{
            // Use un Unwrapping :O
            edadPerros = razaGigante[edad]!
            return edadPerros
        }
        
        
        func edadPerro(_ raza: String ,_ edad: Int){
        switch raza {
        case "pequeña":
            edadPerros = casePequeña(edad)
            mensaje(raza, edad, edadPerros)
            
        case "mediana":
            edadPerros=caseMediana(edad)
            mensaje(raza, edad, edadPerros)
        
        case "grande":
             edadPerros = caseGrande(edad)
            mensaje(raza, edad, edadPerros)
            
        case "gigante":
            
             edadPerros = caseGigante(edad)
            mensaje(raza, edad, edadPerros)
            
        default:
            mensajeDefaultRaza()
        }
          
        }
        
        func correrApp(_ raza : String , _ edad: Int){
          let runApp = validarValores(edad)
            //print(runApp)
            if runApp==true{
                edadPerro(raza, edad)
            }else{
                mensajeDefaultEdad()
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }



