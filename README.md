# Fork this repository to start a new project
i.e., be careful not to make custom project commits to this repository

## Installation

You will need to have recent versions of docker (w/ docker compose) installed. Run the following in the project root to get started

	cp sample.env .env
	docker compose up --build 

To run and build in the background:

	docker compose up -d --build 

To run without building

	docker compose up -d 

To stop

	docker compose down

