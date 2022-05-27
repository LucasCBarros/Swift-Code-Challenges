// MARK: Name: Yelp Challenge 02 - Interactions
// Link: Private

//MARK: - Problem Description:
/**
 We want to suggest Yelp clients to leave review, so we get their last interaction with given
 business to know rather if there is a higher chance for them to leave a review.
 
 Therefore, given a list of interactions with the Business ID and type if interaction, the
 function needs to return a list of the business IDs in order of most likely to be reviewed by
 the user. If the score is a tie, then the ID must be in crescent order.
 */

//MARK: - Given Strutures:
import Foundation

struct Interaction: Codable {
    let type: InteractionType
    let businessID: Int
    
    enum CodingKeys: String, CodingKey {
        case type = "interaction_type"
        case businessID = "business_id"
    }
}

enum InteractionType: String, Codable {
    case reviewDraft = "review draft"
    case photo
    case checkIn = "check-in"
    case bookmark
    
    /**
     The weighted value of the interaction. Businesses with higher-valued
     interactions should be suggested for review above those with lower-valued
     interactions.
     */
    var weight: Double {
        switch self {
        case .reviewDraft:
            return 2.0
        case .photo:
            return 1.0
        case .checkIn:
            return 0.8
        case .bookmark:
            return 0.25
        }
    }
}

//MARK: - Expected Result:
/**
 Returns business IDs in suggested review order.
 
 Given:
 
 let weightedInteractions = [
 Interaction(type: .photo, businessID: 1),
 Interaction(type: .bookmark, businessID: 2),
 Interaction(type: .checkIn, businessID: 3),
 Interaction(type: .reviewDraft, businessID: 4),
 Interaction(type: .checkIn, businessID: 4),
 ]
 
 Then:
 
 businesses(sortedFrom: weightedInteractions) == [4, 1, 3, 2]
 */


//MARK: - Solution:
func businesses(sortedFrom weightedInteractions: [Interaction]) -> [Int] {
    // Output = List of BizzIDs by highest review score
    var businessScores: [Int: Double] = [:]
    var finalResult: [Int] = []
    
    for referenceInteraction in weightedInteractions {
        
        var businessScore: (id: Int, score: Double) = (id: referenceInteraction.businessID, score: referenceInteraction.type.weight)
        var comparedBusiness: Interaction
        
        for interaction in weightedInteractions {
            comparedBusiness = interaction
            if interaction.businessID == referenceInteraction.businessID {
                businessScore.score = businessScore.score + interaction.type.weight
            }
        }
        
        if comparedBusiness.businessID == referenceInteraction.businessID {
            
        } else {
            businessScores[businessScore.id] = businessScore.score
        }
        
    }
    
    // Order output by score
//    businessScores.sort { first, second in
//        return first.score > second.score
//    }
    
    print(businessScores)
    
    for business in businessScores {
//        finalResult.append(business.id)
    }
    
    // Obs: IF score tie THEN order by ID
    
    return finalResult
}

//MARK: - Unit Tests:

var interactionArray = [Interaction(type: .photo, businessID: 1),
                        Interaction(type: .bookmark, businessID: 2),
                        Interaction(type: .checkIn, businessID: 3),
                        Interaction(type: .reviewDraft, businessID: 4),
                        Interaction(type: .checkIn, businessID: 4)]

businesses(sortedFrom: interactionArray)
// MARK: >> INCOMPLETE <<
