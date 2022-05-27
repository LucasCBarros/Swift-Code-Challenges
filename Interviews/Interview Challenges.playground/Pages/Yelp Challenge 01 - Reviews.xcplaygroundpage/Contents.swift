// MARK: Name: Yelp Challenge 01 - Reviews
// Link: Private

//MARK: - Problem Description:
/*
 
 */

//MARK: - Given Strutures:
import Foundation

struct PositiveReview {
    var userID: Int
    var businessID: Int
    
    init(_ userID: Int, _ businessID: Int) {
        self.userID = userID
        self.businessID = businessID
    }
}

//MARK: - Expected Result:
/*
Sample Input
    {
        "businessOfInterestID": 10,
        "positiveReviews": [
            PositiveReview(
                "userID": 1,
                "businessID": 10
            ),
            PositiveReview(
                "userID": 2,
                "businessID": 10
            ),
            PositiveReview(
                "userID": 1,
                "businessID": 11
            ),
            PositiveReview(
                "userID": 2,
                "businessID": 11
            ),
            PositiveReview(
                "userID": 1,
                "businessID": 12
            ),
            PositiveReview(
                "userID": 2,
                "businessID": 12
            ),
            PositiveReview(
                "userID": 3,
                "businessID": 12
            )
        ]
    }
Sample Output
    11
Business Similarity Score against business 10:
    11: 2 / (2 + 2 - 2) = 1.0
    12: 2 / (2 + 3 - 2) = 0.667
*/


// MARK: Solution
func mostSimilarBusiness(businessOfInterestID: Int,
                         positiveReviews: [PositiveReview]) -> Int {
    var targetBizSatisfiedUsers: [Int] = []
    
    var listOfBusiness: [Int] = []
    var businessQuantityReview: [Int] = []
    
    var listOfCommonReviews: [Int] = []
    
    
    // Same users + Same Biz = similar Biz
    // FIND the most similar Biz AND return ID
    // Formula: Number of common Reviews AB / (Number of reviews A + Number of reviews B - Number of common Reviews AB)
    // Get "Number of common Reviews AB"
    
    // Get "Number of reviews A" - OK
    targetBizSatisfiedUsers.count
    // Get "Number of reviews B"
    businessQuantityReview[0]
    
    
    // Need to find number of total reviews from a business AND need to find number of common reviews from business
    
    // 1st: Find users that reviewed target biz (List of users)
    for review in positiveReviews {
        if review.businessID == businessOfInterestID {
            targetBizSatisfiedUsers.append(review.userID)
        }
    }
    
    // Get All business that were reviewed
    for review in positiveReviews {
        if !listOfBusiness.contains(review.businessID), review.businessID != businessOfInterestID {
            listOfBusiness.append(review.businessID)
        }
    }
    
    // Get quantity of reviews of each business
    for business in 0..<listOfBusiness.count {
        businessQuantityReview.append(0)
        for review in positiveReviews {
            if review.businessID == listOfBusiness[business], review.businessID != businessOfInterestID {
                businessQuantityReview[business] += 1
            }
        }
    }
    
//    // 2nd: Find business with same user reviews (list of business)
//    for review in positiveReviews {
//        for user in targetBizSatisfiedUsers {
//            if review.userID == user {
//                businessReviewedBySameUsers.append(review.businessID)
//            }
//        }
//    }
    
    
    // 3nd: Get number of common reviews
    for business in 0..<listOfBusiness.count {
        listOfCommonReviews.append(0)
        for review in positiveReviews {
            if review.businessID == listOfBusiness[business], targetBizSatisfiedUsers.contains(review.userID) {
                listOfCommonReviews[business] += 1
            }
        }
    }
    
    var highestScore: Double = 0
    var selectedBusiness: Int = 0
    // Apply formula
    for business in 0..<listOfBusiness.count {
        
        let similarityScore: Double = Double(listOfCommonReviews[business] / targetBizSatisfiedUsers.count + businessQuantityReview[business] - listOfCommonReviews[business])
        
        if similarityScore > highestScore {
            highestScore = similarityScore
            selectedBusiness = listOfBusiness[business]
        }
    }
    
    
    return selectedBusiness
}

//MARK: - Unit Tests:

var listOfReviews = [
    PositiveReview(5,5)
]
mostSimilarBusiness(businessOfInterestID: 10, positiveReviews: listOfReviews)
// MARK: >> INCOMPLETE <<
