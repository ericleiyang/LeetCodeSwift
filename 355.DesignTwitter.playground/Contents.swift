import UIKit

class Twitter {

    typealias FollowerId = Int
    typealias FolloweeId = Int
    typealias UserId = Int
    typealias TwitterId = Int
    
    var followerDict: [FolloweeId: [FollowerId]]
    var twitterDict: [UserId: [TwitterId]]
    var newfeedDict: [UserId: [TwitterId]]
    
    /** Initialize your data structure here. */
    init() {
        self.followerDict = [:]
        self.twitterDict = [:]
        self.newfeedDict = [:]
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        if var twitter = twitterDict[userId] {
            twitter.insert(tweetId, at: 0)
            twitterDict[userId] = twitter
        }else {
            let twitter = [tweetId]
            twitterDict[userId] = twitter
        }
        
        updateFeed(userId, tweetId)
        if let followers = followerDict[userId] {
            for follower in followers {
                updateFeed(follower, tweetId)
            }
        }
    }
    
    private func updateFeed(_ userId: Int, _ tweeId: Int) {
        if var twitter = newfeedDict[userId] {
            twitter.insert(tweeId, at: 0)
            newfeedDict[userId] = twitter
        }else {
            let twitter = [tweeId]
            newfeedDict[userId] = twitter
        }
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        guard let feed = newfeedDict[userId] else {
            return [Int]()
        }
        if feed.count <= 10 {
            return feed
        }

        return Array(feed[0..<10])
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }


        if var followers = followerDict[followeeId] {
            followers.insert(followerId, at: 0)
            followerDict[followeeId] = followers
        }else {
            let followers = [followerId]
            followerDict[followeeId] = followers
        }
        
        upFeed(followerId, followeeId)
    }
    
    private func upFeed(_ followerId: Int, _ followeeId: Int) {
        if let feeds = twitterDict[followeeId] {
            if var newfeed = newfeedDict[followerId] {
                for feed in feeds {
                    if !newfeed.contains(feed) {
                        newfeed.insert(feed, at: 0)
                    }
                }
                newfeedDict[followerId] = newfeed
            }else {
                newfeedDict[followerId] = feeds
            }
        }
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard followerId != followeeId else { return }


        if var followers = followerDict[followeeId] {
            for(index, follower) in followers.enumerated() {
                if followerId == follower {
                    followers.remove(at: index)
                }
            }
            followerDict[followeeId] = followers
            removeFeed(followerId, followeeId)
        }
    }
    
    private func removeFeed(_ followerId: Int, _ followeeId: Int) {
        if let tweets = twitterDict[followeeId] {
            if var feeds = newfeedDict[followerId] {
                for (index, feed) in feeds.enumerated() {
                    if tweets.contains(feed) {
                        feeds.remove(at: index)
                    }
                }
                newfeedDict[followerId] = feeds
            }
        }
    }
}

let obj = Twitter()
obj.postTweet(2, 5)
obj.postTweet(1, 3)
obj.postTweet(1, 101)
obj.postTweet(2, 13)
obj.postTweet(2, 10)

obj.getNewsFeed()
obj.follow(2, 1)
obj.getNewsFeed(2)
obj.unfollow(2, 1)
obj.getNewsFeed(2)
/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */

//["Twitter","postTweet","getNewsFeed","follow","postTweet","getNewsFeed","unfollow","getNewsFeed"]
//[[],[1,5],[1],[1,2],[2,6],[1],[1,2],[1]]
//["Twitter","postTweet","getNewsFeed","follow","getNewsFeed","unfollow","getNewsFeed"]
//[[],[1,1],[1],[2,1],[2],[2,1],[2]]
//["Twitter","postTweet","postTweet","postTweet","postTweet","postTweet","postTweet","postTweet","postTweet","postTweet","postTweet","getNewsFeed","follow","getNewsFeed"]
//[[],[2,5],[1,3],[1,101],[2,13],[2,10],[1,2],[2,94],[2,505],[1,333],[1,22],[2],[2,1],[2]]
