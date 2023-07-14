import os
import random
from datetime import datetime, timedelta

def makeCommits(days: int):
    if days < 1:
        os.system('git push')
    else:
        random_date = datetime.now() - timedelta(days=random.randint(1, 365))
        dates = random_date.strftime("%Y-%m-%d")
        
        num_commits = random.randint(1, 10)  # Generate a random number of commits per day
        
        for _ in range(num_commits):
            with open('data.txt', 'a') as file:
                file.write(f'{dates} <- this was the commit for the day!!\n')
            
            # staging
            os.system('git add data.txt')
            
            # commit
            os.system('git commit --date="' + dates + '" -m "Random commit"')
        
        return days * makeCommits(days - 1)

makeCommits(365)
