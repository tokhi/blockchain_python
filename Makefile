setup:
	docker-compose build
start:
	brownie run scripts/deploy.py --network ganache-local
terminal:
	docker-compose run sandbox bash 
ganach:
	docker-compose run --rm sandbox ganache-cli --deterministic &
	# brownie networks add Ethereum ganache-local host=http://127.0.0.1:8545 chainid=1337