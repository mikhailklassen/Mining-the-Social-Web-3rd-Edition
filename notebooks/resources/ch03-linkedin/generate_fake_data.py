import names # pip install names
import random
import csv

n_connections = 500

csvReader = csv.reader(open('sp500.csv'), delimiter=',', quotechar='"')
companies = [row[1] for row in csvReader]

with open('occupations.txt') as f:
    occupations = f.read().splitlines() 

def generate_fake_profile():
    first_name = names.get_first_name()
    last_name = names.get_last_name()
    email = first_name.lower() + last_name.lower() + '@fakemail.com'
    company = random.choice(companies)
    position = random.choice(occupations)
    connectedOn = '{0}/{1}/{2}'.format(random.randint(1,12), random.randint(1,28), random.randint(2003,2016))
    row = '{0},{1},{2},"{3}",{4},{5},\n'.format(first_name, last_name, email, company, position, connectedOn)
    return row

def generate_fake_connections_csv(n_connections):
    f = open('Connections.csv','w')
    f.write('FirstName,LastName,EmailAddress,Company,Position,ConnectedOn,Tags\n')
    for _ in range(n_connections):
        row = generate_fake_profile()
        f.write(row)
    f.close()

generate_fake_connections_csv(n_connections)
