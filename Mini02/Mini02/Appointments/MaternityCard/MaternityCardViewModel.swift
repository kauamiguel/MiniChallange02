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
    
    //Function that assign the id to the new Consult based on the history
    func createConsultID(treemesterNumber : Int) -> Int{
        
        coreDataManager.fetchPacient()
        let allConsults = coreDataManager.getConsults()
        var consultsOfThisSemester = [ConsultEntity]()
        
        for consult in allConsults{
            if consult.tremesteer == treemesterNumber{
                consultsOfThisSemester.append(consult)
            }
        }
        
        if consultsOfThisSemester.isEmpty{
            //That means that is the first consult
            return 1
        }else{
            //That means that already exist consults, so increment one of the last
            guard let consultId = consultsOfThisSemester.last?.consultId else {return 0}
            return Int(consultId + 1)
        }
    }
}
