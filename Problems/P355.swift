// Created on 2020/4/13

import XCTest
import List

/*
 https://leetcode-cn.com/problems/design-twitter/
 355. Design Twitter
 Design a simplified version of Twitter where users can post tweets, follow/unfollow another user and is able to see the 10 most recent tweets in the user's news feed. Your design should support the following methods:

 postTweet(userId, tweetId): Compose a new tweet.
 getNewsFeed(userId): Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent.
 follow(followerId, followeeId): Follower follows a followee.
 unfollow(followerId, followeeId): Follower unfollows a followee.
 Example:

 Twitter twitter = new Twitter();

 // User 1 posts a new tweet (id = 5).
 twitter.postTweet(1, 5);

 // User 1's news feed should return a list with 1 tweet id -> [5].
 twitter.getNewsFeed(1);

 // User 1 follows user 2.
 twitter.follow(1, 2);

 // User 2 posts a new tweet (id = 6).
 twitter.postTweet(2, 6);

 // User 1's news feed should return a list with 2 tweet ids -> [6, 5].
 // Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
 twitter.getNewsFeed(1);

 // User 1 unfollows user 2.
 twitter.unfollow(1, 2);

 // User 1's news feed should return a list with 1 tweet id -> [5],
 // since user 1 is no longer following user 2.
 twitter.getNewsFeed(1);
 */

class P355: XCTestCase {
    
    class Twitter {
        
        class Tweet {
            let id: Int
            var timestamp = 0
            var next: Tweet? = nil
            
            init(_ id: Int) {
                self.id = id
            }
        }
        
        var totalTweets = 0
        var tweets: [Int: Tweet] = [:]          // [userId: Tweet]
        var followings: [Int: Set<Int>] = [:]   // [follower: [followees]]
        
        /** Initialize your data structure here. */
        init() {}
        
        /** Compose a new tweet. */
        func postTweet(_ userId: Int, _ tweetId: Int) {
            totalTweets += 1
            
            let tweet = Tweet(tweetId)
            tweet.timestamp = totalTweets       // simulate timestamp
            
            if let lastTweet = tweets[userId] {
                tweet.next = lastTweet
            }
            tweets[userId] = tweet
        }
        
        /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
        func getNewsFeed(_ userId: Int) -> [Int] {
            var users: Set<Int> = [userId]
            for id in followings[userId] ?? [] {
                users.insert(id)
            }
            
            var userTweets: [Tweet] = []
            for id in users {
                if let tweet = tweets[id] {
                    userTweets.append(tweet)
                }
            }
            
            var feeds: [Int] = []
            while !userTweets.isEmpty && feeds.count < 10 {
                var latestIndex = -1
                for i in 0..<userTweets.count {
                    if latestIndex == -1 || userTweets[i].timestamp > userTweets[latestIndex].timestamp {
                        latestIndex = i
                    }
                }
                
                if latestIndex != -1 {
                    let tweet = userTweets[latestIndex]
                    if tweet.next != nil {
                        userTweets[latestIndex] = tweet.next!
                    } else {
                        userTweets.remove(at: latestIndex)
                    }
                    feeds.append(tweet.id)
                }
            }
            return feeds
        }
        
        /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
        func follow(_ followerId: Int, _ followeeId: Int) {
            followings[followerId, default: []].insert(followeeId)
        }
        
        /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
        func unfollow(_ followerId: Int, _ followeeId: Int) {
            followings[followerId, default: []].remove(followeeId)
        }
    }
    
    func testTwitter() {
        let twitter = Twitter()

        // User 1 posts a new tweet (id = 5).
        twitter.postTweet(1, 5)

        // User 1's news feed should return a list with 1 tweet id -> [5].
        XCTAssertEqual(twitter.getNewsFeed(1).description, "[5]")

        // User 1 follows user 2.
        twitter.follow(1, 2)

        // User 2 posts a new tweet (id = 6).
        twitter.postTweet(2, 6)

        // User 1's news feed should return a list with 2 tweet ids -> [6, 5].
        // Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
        XCTAssertEqual(twitter.getNewsFeed(1).description, "[6, 5]")

        // User 1 unfollows user 2.
        twitter.unfollow(1, 2)

        // User 1's news feed should return a list with 1 tweet id -> [5],
        // since user 1 is no longer following user 2.
        XCTAssertEqual(twitter.getNewsFeed(1).description, "[5]")
    }

}
