#Friends You May Know

Facebook wants to interview you! Could you write a method to suggest "Friend you may know" to facebook users, based on the number of common friends between two unlinked users? Friendly reminder: Facebook had 1.49 billion monthly active users as of the second quarter of 2015, and we assume only mutual friendship existed. Here are sample input, each letter represent an unique user, the format of each line is User: Friend, Friend, Friend...

A: B, C, D, G
E: B, C, D
K: L, J, G
.....

Your method should suggest user A and E to make friend to each other but not to User K, because User A and E get several common friends (B, C, D), like this:
A: E
E: A
K:

Please discuss Big(O), compare the trade-off with your interviewers. Is your method feasible for the entire user database in Facebook?

Further discussion: The code you write here would be batch process all users all at once from the input.  What's asynchronous approach?