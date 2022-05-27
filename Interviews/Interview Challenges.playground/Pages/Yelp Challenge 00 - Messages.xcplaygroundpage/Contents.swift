// MARK: Name: Yelp Challenge 00 - Messages
// Link: Private

//MARK: - Problem Description:
/*
 
 */

//MARK: - Given Strutures:
struct Message {
    var sender: Int
    var recipient: Int
    var conversationId: Int
    
    init(_ sender: Int, _ recipient: Int,_ id: Int) {
        self.sender = sender
        self.recipient = recipient
        self.conversationId = id
    }
}

// MARK: Expected Output
/*
    Sample Input:
        bizOwnerId: 42
        allMessages: [
            {"sender": 1,  "recipient": 42, "conversationId": 1},
            {"sender": 42, "recipient": 1,  "conversationId": 1},
            {"sender": 2,  "recipient": 42, "conversationId": 2},
            {"sender": 2,  "recipient": 42, "conversationId": 2},
            {"sender": 3,  "recipient": 88, "conversationId": 3},
            {"sender": 3,  "recipient": 42, "conversationId": 4},
        ]

    Sample Output:
        33 (Business owner 42 received three conversations total (1, 2, and 4), but only
        responded to one conversation (conversation ID 1)).
*/

// MARK: Solution
func bizOwnerResponseRate(_ bizOwnerId: Int, _ allMessages: [Message]) -> Int {
    // TODO: COMPLETE ME
    // This will be the answer, and defalt value should be 0
    var bizResponseRate = 0
    var receivedMessages: [Message] = []
    var sentMessages: [Message] = []
    
    // Separate received and sent messages
    
    for message in allMessages {
        // Check if the owner received messages
        if message.sender != bizOwnerId, message.recipient == bizOwnerId {
            receivedMessages.append(message)
        }
    }
    
    // TO DO: Need to check if the owner didn't start the conversation first
    
    // Check if the owner sent message but only if he didn't start the conversation
    for message in allMessages {
        if message.sender == bizOwnerId {
            
            for receivedMessage in receivedMessages {
                if message.recipient == receivedMessage.sender {
                    sentMessages.append(message)
                    break
                }
            }
        }
    }
    
    // Conside the rate formula:
    // # Messages Owner sent DIVIDED BY # Messages Owner received MULTIPLIED BY 100
    if sentMessages.count != 0, receivedMessages.count != 0 {
        let doubleResult = Double(sentMessages.count) / Double(receivedMessages.count)
        bizResponseRate = Int(doubleResult * 100)
    }
    
    return bizResponseRate
}

// MARK: Unit Tests
var messages = [
    Message(81, 842, 81),
    Message(842, 81, 81),
    Message(81, 842, 81),
    Message(842, 81, 81),

    Message(82, 842, 82),
    Message(82, 842, 82),

    Message(83, 842, 83),
    Message(842, 83, 83) ]

bizOwnerResponseRate(842, messages)
// MARK: >> INCOMPLETE <<

