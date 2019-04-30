import requests as rq
import json

def test(function, data, method):
	if method == 'post':
		r = rq.post('http://127.0.0.1/' + function + '.php', data=json.dumps(data))
	else:
		r = rq.get('http://127.0.0.1/' + function + '.php')
	if r.status_code > 299 or 'error' in r.content:
		print('\nERROR: ' + function)
		print(r.content)
		exit(1)
	else:
		print(function + ' Passed.')

functions = ['create_company', 'login', 'readCompanyById', 'updateCompany']
data = {'create_company' : {
                            "NAME" : "Vodafone",
                            "EMAIL" : "vod@g.com",
                            "PASSWORD" : "strongpassword",
                            "NUMEMPLOYEES" : "60500",
                            "interests" : "ml,ai,nlp",
                            "locations" : "cairo,fayoom,helwan"
                            },
                'login' : 	{
                            'EMAIL' : 'vod@g.com',
                            'PASSWORD' : 'strongpassword'
                            },
		'readCompanyById' : {
                            'USERID' : '10'
                            },
		'updateCompany' : 	{
                            "NAME" : "Valeo",
                            "EMAIL" : "vod@g.com",
                            "NUMEMPLOYEES" : "50",
                            "INTERESTS" : "ml,ai",
                            "LOCATIONS" : "maadi"
                            }
		} 

for function in functions:
	test(function, data[function], 'post')
test('readCompany', '', 'get')
#test('readById', data['readById'])