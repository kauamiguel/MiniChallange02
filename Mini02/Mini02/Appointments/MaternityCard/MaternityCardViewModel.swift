//
//  MaternityCardViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 21/09/23.
//

import Foundation
import UIKit


class MaternityCardViewModel{
    var coreDataManager = CoreDataFunctions()
    var consults : [ConsultEntity]?
    
    init(){
        //Update the current data of pacient
        coreDataManager.fetchPacient()
        self.consults = coreDataManager.getConsults()
    }
    
    func createNewConsult(consult : Consulta){
        coreDataManager.addNewConsult(newConsult: consult)
    }
}
