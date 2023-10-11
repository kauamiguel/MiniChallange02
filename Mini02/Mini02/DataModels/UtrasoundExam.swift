//
//  UtrasoundExam.swift
//  Mini02
//
//  Created by Daniel Ishida on 23/09/23.
//

import Foundation

struct IdadeGestacional{
    var semanas:Int
    var dias:Int
}
enum Placenta:String, CaseIterable{
    case anterior = "Anterior"
    case posterior = "Posterior"
    case laterarD = "Lateral direita"
    case lateralE = "Lateral esquerda"
    case fundal = "Fundal"
    case baixa = "Baixa"
    case marginal = "Marginal"
    case central = "Central"
}
enum FetalPosition:String, CaseIterable{
    case cefalica = "Cefálica"
    case pelvica = "Pélvica"
    case transversa = "Transversa"
}

struct UltrasoundExam{
    
    var date : Date
    /*this one will be calculated with the Date
     of last menstruation or the US exam with the
     baby weight(not sure)*/
    var consultNumber : Int
    var ig: IdadeGestacional
    var ILA:Int
    var gestacionalAge : Int
    
    var weight:Float // The weight of the baby
    
    var placenta:Placenta
    
    // TODO: need to check how the liquid (ILA) is registered
    
    var fetalPosition:FetalPosition // TODO: need to check this one too
    
}
