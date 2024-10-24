# Walk Point URI - A/B Testing Ideas


## Test Idea #4
A/B Test Name: App Rating: Use Again or Recommend to Others

User Story Number: US4

Metrics: NPS, User Satisfaction, Retention Rate

Hypothesis: We aim to improve user retention and referral rates. By determining which question (use again or recommend) generates more positive feedback, we can optimize our user feedback process. My hypothesis is that users who are asked if they would use the app again are more likely to give a positive rating compared to users who are asked if they would recommend the app to others. 

Experiment:
  Audiences: 50% of users will see Variation A (Use Again), and 50% will see Variation B (Recommend to Others).
  Duration: 2 weeks
  Randomization: Users will be randomly assigned to either variation using Firebase Remote Config.
  Tracking: Set up Firebase Analytics to track the response rates and user engagement for each variation. Key events to track include feedback submission and subsequent app usage.

Variations: 
  Have a page with a survey for users asking them a question and way to rate it 1-10 (slider or dropdown menu), only change the question phrasing on the page.
    Variation A: Question: "Would you use this app again?"
    Variation B: Question: "Would you recommend this app to others?"
