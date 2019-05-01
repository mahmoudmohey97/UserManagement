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
		return False
	else:
		print(function + ' Passed.')
		return True

functions = ['create_user', 'login', 'readById', 'update']
data = {'create_user' : {
						'FNAME' : 'Mahmoud',
						'LNAME' : 'Mohey',
						'EMAIL' : 'm.mohey@email.com',
						'MOBILENUM' : '01115',
						'GENDER' : 'male',
						'AGE' : '23',
						'USERNAME' : 'm.mohey',
						'PASSWORD' : 'strongpassword',
						'SKILL' : 'programming',
						'interests' : 'ml,ai,lol'
						},
			'login' : 	{
						'EMAIL' : 'm.mohey@email.com',
						'PASSWORD' : 'strongpassword'
						},
		'readById' : 	{
						'USERID' : '4'
						},
			'update' : 	{
						'EMAIL' : 'm.mohey@email.com',
						'AGE' : '21',
						'GENDER' : 'MALE',
						'SKILL' : 'nothing',
						'MOBILENUM' : '01125985459',
						'FNAME' : 'Mohey',
						'LNAME' : 'Mahmoud',
						'interests' : 'ai'
						}
		} 

fails = 0
for function in functions:
	if not test(function, data[function], 'post'):
		fails += 1
if not test('read', '', 'get'):
	fails += 1
exit(fails)